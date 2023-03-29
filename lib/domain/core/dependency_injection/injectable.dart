import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/dependency_injection/injectable.config.dart';

//obj
final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  // This method call to main file
  await $initGetIt(getIt, environment: Environment.prod);
}
