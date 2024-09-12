import 'package:customersouqjumla/domain/dependence_injection/injectable.config.dart';
import 'package:customersouqjumla/presentation/provider/authprovider/loginprovider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configurationInjection() async {
  getIt.init(environment: Environment.prod);
}
