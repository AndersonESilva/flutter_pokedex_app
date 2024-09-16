
import 'package:get_it/get_it.dart';

import '../../data/data_sources/poke_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../network/network_manager.dart';
import '../../domain/use_cases/get_battery_level_usecase.dart';
import '../../domain/use_cases/get_pokemons_usecase.dart';
import '../../features/home/presentation/stores/home_store.dart';
import '../../features/pokemons/presentation/stores/pokemons_store.dart';
import '../infrastructure/platform/battery_service.dart';

final getIt = GetIt.instance;

void setupMainDI(){
  setupRepositories();
  setupPlatform();
  setupUseCases();
  setupStores();
}

void setupRepositories() {
  const baseUrl = 'https://pokeapi.co/api/v2/';

  getIt.registerSingleton<NetworkManager>(NetworkManager(baseUrl));
  getIt.registerSingleton<PokeDataSource>(PokeDataSource(getIt<NetworkManager>()));
  getIt.registerSingleton<PokemonRepository>(PokemonRepositoryImpl(getIt<PokeDataSource>()));
}

void setupPlatform() {
  getIt.registerSingleton<BatteryService>(BatteryService());
}

void setupUseCases() {
  getIt.registerSingleton<GetPokemonsUseCase>(GetPokemonsUseCase(getIt<PokemonRepository>()));
  getIt.registerSingleton<GetBatteryLevelUseCase>(GetBatteryLevelUseCase(getIt<BatteryService>()));
}

void setupStores() {
  getIt.registerSingleton<PokemonsStore>(PokemonsStore(getIt<GetPokemonsUseCase>()));
  getIt.registerSingleton<HomeStore>(HomeStore(getIt<GetBatteryLevelUseCase>()));
}
