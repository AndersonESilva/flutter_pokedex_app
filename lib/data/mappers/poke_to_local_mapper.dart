
import '../../core/utils/string.dart';
import '../../domain/entities/pokemon_name.dart';
import '../models/api_pokemon.dart';

extension ApiPokemonExtensions on ApiPokemon {
  List<PokemonName> toPokemonNameList() {
    return results.map((apiPokemonName) =>
        PokemonName(name: capitalizeFirstLetter(apiPokemonName.name))).toList();
  }
}
