
import 'dart:convert';

import '../../core/network/error/failure.dart';
import '../../core/network/network_manager.dart';
import '../../core/network/result.dart';
import '../models/api_pokemon.dart';
import '../models/api_pokemon_info.dart';

class PokeDataSource {

  final NetworkManager _networkManager;

  PokeDataSource(this._networkManager);

  Future<Result<ApiPokemon, Failure>> getPokemonNames({required int limit, required int offset}) async {
    final response = await _networkManager.get('/pokemon?limit=$limit&offset=$offset');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final apiPokemons = ApiPokemon.fromJson(data);
      return Result.success(apiPokemons);
    } else {
      return Result.error(Failure(response.statusCode));
    }
  }

  Future<Result<ApiPokemonInfo, Failure>> getPokemonInfo({required String nome}) async {
    final response = await _networkManager.get('/pokemon/$nome');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final apiPokemonInfo = ApiPokemonInfo.fromJson(data);
      return Result.success(apiPokemonInfo);
    } else {
      return Result.error(Failure(response.statusCode));
    }
  }
}
