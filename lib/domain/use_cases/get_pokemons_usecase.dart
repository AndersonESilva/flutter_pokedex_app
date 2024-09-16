
import 'dart:async';

import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/core/utils/use_cases/use_case.dart';

import '../../core/network/error/failure.dart';
import '../entities/pokemon_name.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonsUseCase extends UseCase<Result<List<PokemonName>, Failure>, GetPokemonsParams> {
  final PokemonRepository _repository;

  GetPokemonsUseCase(this._repository);

  @override
  Future<Result<List<PokemonName>, Failure>> call(GetPokemonsParams params) {
    final offset = (params.page - 1) * params.limit;
    return _repository.getPokemonNames(limit: params.limit, offset: offset);
  }
}

class GetPokemonsParams {
  final int limit;
  final int page;

  GetPokemonsParams(this.limit, this.page);
}
