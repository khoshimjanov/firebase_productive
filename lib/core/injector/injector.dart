import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());
}
