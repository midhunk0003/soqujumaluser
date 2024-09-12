import 'dart:convert';
import 'dart:io';

import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/banner_image_model/banner_image_model.dart';
import 'package:customersouqjumla/domain/repositories/banner_image_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: BannerImageRepositories)
class BannerImageRepositoryImplimentation implements BannerImageRepositories {
  @override
  Future<Either<Failure, List<TypeBannerList>>> getBannerImage(
      String? loginToken) async {
    final client = http.Client();

    try {
      final response = await client.get(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/users/bannerlist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      print(
          "response of banner list in repo imple  988888888888888888888888888888888888888888899999999999: ,${response.body}");

      if (response.statusCode == 200) {
        print('jjjjjjjjjjjjjjjjjjjjjjjj');
        List<dynamic> data = json.decode(response.body)['Types'];
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkk');

        final responseTypeBanner =
            data.map((items) => TypeBannerList.fromJson(items)).toList();
        print("inside response repo imp :  $responseTypeBanner");
        return Right(responseTypeBanner);
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
