
import 'package:flutter_pokedex_app/core/di/repositories_di.dart';
import 'package:flutter_pokedex_app/core/di/stores_di.dart';
import 'package:flutter_pokedex_app/core/di/use_cases_di.dart';

void setupMainDI(){
  setupRepositories();
  setupUseCases();
  setupStores();
}
