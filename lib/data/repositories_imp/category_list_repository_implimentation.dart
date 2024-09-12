import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/categoeylist_model/categoeylist_model.dart';
import 'package:customersouqjumla/domain/repositories/category_list_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryListRepositories)
class CategoryListRepositoryImplimentation implements CategoryListRepositories {
  @override
  Future<Either<Failure, List<Category>>> getCategoryList(
      String? loginToken, String? storeId) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/users/categorylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': storeId,
        },
      );

      print(
        " category List response in repo inmplimentation : ${response.body}",
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['category'];
        final categoryResponseList =
            data.map((items) => Category.fromJson(items)).toList();
        print("inside response category in imp repo : $categoryResponseList");
        return Right(categoryResponseList);
      } else if (response.statusCode >= 400) {
        return Left(
          ClientFailure('Client error ${response.statusCode}'),
        );
      } else {
        return Left(
            OtherFailureNon200('Fail With Status ${response.statusCode}'));
      }
    } on SocketException {
      //Handle network related error
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    } finally {
      client.close();
    }
  }
}
