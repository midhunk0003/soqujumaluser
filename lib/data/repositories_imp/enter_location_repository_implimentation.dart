import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/block_list_model/block_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/city_list_model/city_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/country_list_model/country_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/governerlist/governerlist.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/profile_post_location_model/profile_post_location_model.dart';
import 'package:customersouqjumla/domain/repositories/enter_your_location_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: EnterlocationRepositories)
class EnterLocationRepositoryImplimentation extends EnterlocationRepositories {
  ///function country list repoimplimentation
  @override
  Future<Either<Failure, List<Country>>> getCountryList(
      String? loginToken) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/Countrylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      print(
        "country repo impl response : ${response.body}",
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['Country'];
        final dataresponse = data
            .map(
              (item) => Country.fromJson(item),
            )
            .toList();
        return Right(dataresponse);
      } else if (response.statusCode >= 500) {
        return Left(LoginFailure('Failed with status: ${response.statusCode}'));
      } else if (response.statusCode >= 400) {
        // Client-side error
        return Left(ClientFailure('Client error: ${response.statusCode}'));
      } else {
        // Any other non-200 status code
        return Left(LoginFailure('Failed with status: ${response.statusCode}'));
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

  ///governate repo api function
  @override
  Future<Either<Failure, List<Governorate>>> getGovernorateList(
      String? loginToken, String? countryId) async {
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/users/governoratelist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': countryId,
        },
      );

      print("gover repo imp response : ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['governorate'];
        final dataResponse =
            data.map((items) => Governorate.fromJson(items)).toList();
        return Right(dataResponse);
      } else if (response.statusCode >= 400) {
        return Left(ClientFailure('Client error ${response.statusCode}'));
      } else {
        return Left(
            OtherFailureNon200('Fail with status : ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      return Left(ServerFailure('Server Error ${e.toString()}'));
    } finally {
      client.close();
    }
  }

  //city repo api function
  @override
  Future<Either<Failure, List<City>>> getCityList(
      String? loginToken, String? governateId) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/citylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': governateId,
        },
      );
      print("city repo imp response : ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['city'];

        final dataresponse = data.map((items) => City.fromJson(items)).toList();
        return Right(dataresponse);
      } else if (response.statusCode >= 400) {
        return Left(ClientFailure('Client Error ${response.statusCode}'));
      } else {
        return Left(
          OtherFailureNon200('Fail with Status ${response.statusCode}'),
        );
      }
    } on SocketException {
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      return Left(ServerFailure('Server Error ${e.toString()}'));
    } finally {
      client.close();
    }
  }

  //block repo api function
  @override
  Future<Either<Failure, List<CityBlock>>> getCityBlocList(
      String? loginToken, String? cityId) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/blocklist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': cityId,
        },
      );
      print("bloc repo imp response : ${response.body}");

      if (response.statusCode == 200) {
        print('111111111111111111111');
        List<dynamic> data = json.decode(response.body)['city'];

        final dataresponse =
            data.map((items) => CityBlock.fromJson(items)).toList();
        return Right(dataresponse);
      } else if (response.statusCode >= 400) {
        return Left(ClientFailure('Client Error ${response.statusCode}'));
      } else {
        return Left(
          OtherFailureNon200('Fail with Status ${response.statusCode}'),
        );
      }
    } on SocketException {
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      return Left(ServerFailure('Server Error ${e.toString()}'));
    } finally {
      client.close();
    }
  }

  //post detail api repo
  @override
  Future<Either<Failure, Details>> postThedetail(
    String? countryId,
    String? governateId,
    String? cityId,
    String? cityBlocId,
    String? loginToken,
  ) async {
    print("id in repo : $countryId");
    print("id in repo : $governateId");
    print("id in repo : $cityId");
    print("id in repo : $cityBlocId");
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/profile'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'country': countryId,
          'governorate': governateId,
          'city': cityId,
          'block': cityBlocId,
        },
      );

      print("result of details  : ${response.body}");

      if (response.statusCode == 200) {
        print('2222222222222222222222222222222');
        final Map<String, dynamic> responseBody = json.decode(response.body);
        print('333333333333333333333');
        final data = responseBody['details'];
        print('44444444444444444 $data');
        final firstDetails = Details.fromJson(data);
        print('555555555555');
        print('right result first in repo impl : $firstDetails');
        return Right(firstDetails);
      } else if (response.statusCode >= 400) {
        return Left(
          ClientFailure('Client Error ${response.statusCode}'),
        );
      } else {
        return Left(
          OtherFailureNon200('Fail with Status ${response.statusCode}'),
        );
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      return Left(
        ServerFailure('Server Error ${e.toString()}'),
      );
    } finally {
      client.close();
    }
  }

  //post the details
}
