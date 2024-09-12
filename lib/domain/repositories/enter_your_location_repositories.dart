import 'package:customersouqjumla/data/core/failure.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/block_list_model/block_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/city_list_model/city_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/country_list_model/country_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/governerlist/governerlist.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/profile_post_location_model/profile_post_location_model.dart';
import 'package:dartz/dartz.dart';

abstract class EnterlocationRepositories {
  Future<Either<Failure, List<Country>>> getCountryList(
    String? loginToken,
  );
  Future<Either<Failure, List<Governorate>>> getGovernorateList(
    String? loginToken,
    String? countryId,
  );
  Future<Either<Failure, List<City>>> getCityList(
    String? loginToken,
    String? governateId,
  );
  Future<Either<Failure, List<CityBlock>>> getCityBlocList(
    String? loginToken,
    String? cityId,
  );
  Future<Either<Failure, Details>> postThedetail(
    String? countryId,
    String? governateId,
    String? cityId,
    String? cityBlocId,
    String? loginToken,
  );

  // Future<Either<Failure,
}
