
import '../../domain/entities/pokemon_info.dart';
import '../../domain/entities/pokemon_name.dart';
import '../models/api_pokemon.dart';
import '../models/api_pokemon_info.dart';

extension ApiPokemonExtensions on ApiPokemon {
  List<PokemonName> toPokemonNameList() {
    return results.map((apiPokemonName) =>
        PokemonName(name: apiPokemonName.name)).toList();
  }
}

extension ApiPokemonInfoExtensions on ApiPokemonInfo {
  PokemonInfo toPokemonInfo() {
    final typeNames = types.map((type) => type.name).toList();
    return PokemonInfo(image: frontDefault, types: typeNames);
  }
}
