import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/userdatamodel/userdatamodel.dart';
import 'package:customersouqjumla/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepositories)
class ProfileRepositoryImplimentation implements ProfileRepositories {
  @override
  Future<Either<Failure, UserData>> getUserProfile(String? loginToken) async {
    final client = http.Client();

    try {
      final response = await client.get(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/userdata'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      print("get user data in repo  impliment class: ${response.body}");
      if (response.statusCode == 200) {
        final responsData = json.decode(response.body)['data'];
        final userData = UserData.fromJson(responsData);
        print('userData: $userData');
        return Right(userData);
      } else {
        return Left(ServerFailure('server failuer ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure("No Internet Connection"));
    } catch (e) {
      return Left(ServerFailure('server failuer ${e.toString()}'));
    } finally {
      client.close();
    }
  }
}
