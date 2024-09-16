
import 'package:flutter_pokedex_app/core/network/error/failure.dart';

import '../../core/network/result.dart';
import '../entities/pokemon_name.dart';

abstract class PokemonRepository {
  const PokemonRepository();

  Future<Result<List<PokemonName>, Failure>> getPokemonNames ({required int limit, required int offset}) ;
}
