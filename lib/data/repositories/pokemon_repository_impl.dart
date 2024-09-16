
import 'package:flutter_pokedex_app/data/data_sources/poke_datasource.dart';
import 'package:flutter_pokedex_app/data/mappers/poke_to_local_mapper.dart';
import 'package:flutter_pokedex_app/domain/repositories/pokemon_repository.dart';

import '../../core/network/error/failure.dart';
import '../../core/network/result.dart';
import '../../domain/entities/pokemon_name.dart';
import '../models/api_pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  final PokeDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<PokemonName>, Failure>> getPokemonNames({required int limit, required int offset}) async {
    try {
      final response = await _dataSource.getPokemonNames(limit: limit, offset: offset);

      if(response.isSuccess){
        final pokemonNames = (response.value as ApiPokemon).toPokemonNameList();
        return Result.success(pokemonNames);
      } else {
        return Result.error(Failure(response.error!.statusCode));
      }
    } catch (e) {
      return Result.error(Failure(e.hashCode));
    }
  }
}

