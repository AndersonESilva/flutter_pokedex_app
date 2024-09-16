
import 'api_pokemon_name.dart';

class ApiPokemon {
  final int count;
  final List<ApiPokemonName> results;

  ApiPokemon({required this.count, required this.results});

  factory ApiPokemon.fromJson(Map<String, dynamic> json) {
    return ApiPokemon(
        count: json['count'],
        results: (json['results'] as List)
          .map((json) => ApiPokemonName.fromJson(json))
          .toList()
    );
  }
}
