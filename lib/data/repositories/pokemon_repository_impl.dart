
import 'package:flutter_pokedex_app/data/data_sources/poke_datasource.dart';
import 'package:flutter_pokedex_app/data/mappers/poke_to_local_mapper.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';
import 'package:flutter_pokedex_app/domain/repositories/pokemon_repository.dart';

import '../../core/network/error/failure.dart';
import '../../core/network/result.dart';
import '../../domain/entities/pokemon_name.dart';
import '../models/api_pokemon.dart';
import '../models/api_pokemon_info.dart';

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

  @override
  Future<Result<PokemonInfo, Failure>> getPokemonInfo({required String nome}) async {
    try {
      final response = await _dataSource.getPokemonInfo(nome: nome);
      if(response.isSuccess){
        final pokemonInfo = (response.value as ApiPokemonInfo).toPokemonInfo();
        return Result.success(pokemonInfo);
      } else {
        return Result.error(Failure(response.error!.statusCode));
      }
    } catch (e) {
      return Result.error(Failure(e.hashCode));
    }
  }
}
