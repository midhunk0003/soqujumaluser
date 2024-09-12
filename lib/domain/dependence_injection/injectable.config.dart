// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories_imp/banner_image_repository_implimentation.dart'
    as _i50;
import '../../data/repositories_imp/cart_repository_implimentation.dart'
    as _i670;
import '../../data/repositories_imp/category_by_product_repository_implimentation.dart'
    as _i83;
import '../../data/repositories_imp/category_list_repository_implimentation.dart'
    as _i945;
import '../../data/repositories_imp/enter_location_repository_implimentation.dart'
    as _i782;
import '../../data/repositories_imp/likeproduct_repositories_implimenattion.dart'
    as _i886;
import '../../data/repositories_imp/login_with_phonenumber_repoimpl.dart'
    as _i682;
import '../../data/repositories_imp/store_repository_implimentation.dart'
    as _i751;
import '../../presentation/provider/authprovider/loginprovider.dart' as _i939;
import '../../presentation/provider/cartprovider/cart_provider.dart' as _i676;
import '../../presentation/provider/enterlocationprovider/enterlocationsprovider.dart'
    as _i132;
import '../../presentation/provider/enterlocationprovider/test.provider.dart'
    as _i628;
import '../../presentation/provider/homeprovider/category_by_product_provider.dart'
    as _i1059;
import '../../presentation/provider/homeprovider/category_provider.dart'
    as _i346;
import '../../presentation/provider/homeprovider/homeccarouselprovider.dart'
    as _i524;
import '../../presentation/provider/likedproductprovider/likedproductprovider.dart'
    as _i431;
import '../../presentation/provider/selectstoreprovider/selectstoreprovider.dart'
    as _i454;
import '../repositories/banner_image_repositories.dart' as _i147;
import '../repositories/cart_repositories.dart' as _i220;
import '../repositories/category_by_product.repositories.dart' as _i616;
import '../repositories/category_list_repositories.dart' as _i793;
import '../repositories/enter_your_location_repositories.dart' as _i1022;
import '../repositories/likeproduct_repositories.dart' as _i939;
import '../repositories/login_with_phone_number_repositories.dart' as _i809;
import '../repositories/store_list_repositories.dart' as _i387;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i939.LikeproductRepositories>(
        () => _i886.LikeproductRepositoriesImplimenattion());
    gh.lazySingleton<_i220.CartRepositories>(
        () => _i670.CartRepositoryImplimentation());
    gh.lazySingleton<_i793.CategoryListRepositories>(
        () => _i945.CategoryListRepositoryImplimentation());
    gh.lazySingleton<_i387.StoreListRepositories>(
        () => _i751.StoreRepositoryImplimentation());
    gh.lazySingleton<_i809.LoginRepositories>(
        () => _i682.LoginRepositoriesImplimentation());
    gh.lazySingleton<_i616.CategoryByProductRepositories>(
        () => _i83.CategoryByProductRepositoryImplimentation());
    gh.lazySingleton<_i1022.EnterlocationRepositories>(
        () => _i782.EnterLocationRepositoryImplimentation());
    gh.lazySingleton<_i147.BannerImageRepositories>(
        () => _i50.BannerImageRepositoryImplimentation());
    gh.factory<_i524.CarouselProvider>(() => _i524.CarouselProvider(
        bannerImageRepositories: gh<_i147.BannerImageRepositories>()));
    gh.factory<_i676.CartProvider>(() =>
        _i676.CartProvider(cartRepositories: gh<_i220.CartRepositories>()));
    gh.factory<_i454.Selectstoreprovider>(() => _i454.Selectstoreprovider(
        storeListRepositories: gh<_i387.StoreListRepositories>()));
    gh.factory<_i939.LoginProvider>(
        () => _i939.LoginProvider(gh<_i809.LoginRepositories>()));
    gh.factory<_i132.Enterlocationsprovider>(() => _i132.Enterlocationsprovider(
        enterlocationRepositories: gh<_i1022.EnterlocationRepositories>()));
    gh.factory<_i628.Enterlocationsprovider>(() => _i628.Enterlocationsprovider(
        enterlocationRepositories: gh<_i1022.EnterlocationRepositories>()));
    gh.factory<_i431.Likedproductprovider>(() => _i431.Likedproductprovider(
        likeproductRepositories: gh<_i939.LikeproductRepositories>()));
    gh.factory<_i346.CategoryProvider>(() => _i346.CategoryProvider(
        categoryListRepositories: gh<_i793.CategoryListRepositories>()));
    gh.factory<_i1059.CategoryByProductProvider>(() =>
        _i1059.CategoryByProductProvider(
            categoryByProductRepositories:
                gh<_i616.CategoryByProductRepositories>()));
    return this;
  }
}
