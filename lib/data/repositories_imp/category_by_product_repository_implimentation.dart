import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/category_product_list_model/category_product_list_model.dart';
import 'package:customersouqjumla/domain/repositories/category_by_product.repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryByProductRepositories)
class CategoryByProductRepositoryImplimentation
    implements CategoryByProductRepositories {
  @override
  Future<Either<Failure, List<CategoryByProduct>>> getCategoryByProduct(
    String? loginToken,
    String? storeId,
    String? categoryId,
  ) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/users/productslist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': storeId,
          'category': categoryId,
        },
      );

      print(
          'list of product based on categort response in repo implimenation : ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['category'];
        final productListresponse =
            data.map((items) => CategoryByProduct.fromJson(items)).toList();
        print('list of product 1111111111 : $productListresponse');
        return Right(productListresponse);
      } else if (response.statusCode >= 500) {
        return Left(ClientFailure('client error ${response.statusCode}'));
      } else {
        return Left(
            OtherFailureNon200('Fail With Status ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure('No Network Connection'));
    } catch (e) {
      return Left(ServerFailure('${e.toString()}'));
    } finally {
      client.close();
    }
  }
}
