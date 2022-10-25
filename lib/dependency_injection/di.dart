import 'package:get_it/get_it.dart';
import 'package:star_buck_animation/services/home_service.dart';

class DependencyInjection{
  static init(){
    // Register all the dependencies here
    GetIt.I.registerLazySingleton<HomeService>(() => HomeService());
  }
}