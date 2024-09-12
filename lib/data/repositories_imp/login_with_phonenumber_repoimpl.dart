import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/login_response_model/login_response_model.dart';
import 'package:customersouqjumla/domain/repositories/login_with_phone_number_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LoginRepositories)
class LoginRepositoriesImplimentation implements LoginRepositories {
  @override
  Future<Either<Failure, LoginResponseModel>> loginWithMobileNumber(
      String? phonenumber, String? fcmToken) async {
    print('phonenumber repo : $phonenumber');
    print('fcm repo : $fcmToken');
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/Login'),
        body: {
          'phone': phonenumber,
          'fcm': fcmToken,
        },
      );
      print("response repo : ${response.body}");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final loginResponse = LoginResponseModel.fromJson(data);
        await _saveToken(loginResponse.token!);
        return Right(loginResponse);
      } else if (response.statusCode >= 500) {
        return Left(LoginFailure('Failed with status: ${response.statusCode}'));
      } else if (response.statusCode >= 400) {
        // Client-side error
        return Left(ClientFailure('Client error: ${response.statusCode}'));
      } else {
        // Any other non-200 status code
        return Left(LoginFailure('Failed with status: ${response.statusCode}'));
      }
    }

//      on http.ClientException catch (e) {
// // Handle client-specific errors
//       return Left(ClientFailure('Clients error: ${e.message}'));
//     }

    on SocketException {
      //Handle network related error
      return Left(NetworkFailure('No internet connection'));
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

  Future<void> _saveToken(String token) async {
    print("share pre $token");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }
}
