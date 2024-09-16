
import 'package:get_it/get_it.dart';

import '../../domain/use_cases/get_battery_level_usecase.dart';
import '../../domain/use_cases/get_pokemons_usecase.dart';
import '../../features/home/presentation/stores/home_store.dart';
import '../../features/pokemons/presentation/stores/pokemons_store.dart';

final getIt = GetIt.instance;

void setupStores() {

  getIt.registerSingleton<PokemonsStore>(PokemonsStore(getIt<GetPokemonsUseCase>()));
  getIt.registerSingleton<HomeStore>(HomeStore(getIt<GetBatteryLevelUseCase>()));
}
