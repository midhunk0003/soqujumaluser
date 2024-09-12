import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/store_detail_model/store_detail_model.dart';
import 'package:customersouqjumla/domain/repositories/store_list_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: StoreListRepositories)
class StoreRepositoryImplimentation implements StoreListRepositories {
  @override
  Future<Either<Failure, List<StoreList>>> getStoreList(
      String? loginToken) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/storelist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'type': '4',
        },
      );

      print('store list in repo impimentaion response : ${response.body}');

      if (response.statusCode == 200) {
        print("999999999999999999");
        List<dynamic> data = json.decode(response.body)['stores'];
        final dataResponse =
            data.map((items) => StoreList.fromJson(items)).toList();
        print("list of data in response : $dataResponse");
        return Right(dataResponse);
      } else if (response.statusCode >= 400) {
        return Left(
          ClientFailure('Client error:'),
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
