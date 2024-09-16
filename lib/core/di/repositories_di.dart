
import 'package:get_it/get_it.dart';

import '../../data/data_sources/poke_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../network/network_manager.dart';

final getIt = GetIt.instance;

void setupRepositories() {
  const baseUrl = 'https://pokeapi.co/api/v2/';

  getIt.registerSingleton<NetworkManager>(NetworkManager(baseUrl));

  getIt.registerSingleton<PokeDataSource>(PokeDataSource(getIt<NetworkManager>()));

  getIt.registerSingleton<PokemonRepository>(PokemonRepositoryImpl(getIt<PokeDataSource>()));
}
