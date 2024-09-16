
import 'package:get_it/get_it.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/use_cases/get_battery_level_usecase.dart';
import '../../domain/use_cases/get_pokemons_usecase.dart';
import '../utils/tool/battery_tool.dart';

final getIt = GetIt.instance;

void setupUseCases() {

  getIt.registerSingleton<GetPokemonsUseCase>(GetPokemonsUseCase(getIt<PokemonRepository>()));
  getIt.registerSingleton<GetBatteryLevelUseCase>(GetBatteryLevelUseCase(BatteryTool()));
}
