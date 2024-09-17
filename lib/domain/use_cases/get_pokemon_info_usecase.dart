
import 'dart:async';

import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';

import '../../core/network/error/failure.dart';
import '../../core/network/result.dart';
import '../../core/utils/use_cases/use_case.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonInfo extends UseCase<Result<PokemonInfo, Failure>, String>{
  final PokemonRepository _repository;

  GetPokemonInfo(this._repository);

  @override
  Future<Result<PokemonInfo, Failure>> call(String params) {
    return _repository.getPokemonInfo(nome: params);
  }
}