
import 'api_pokemon_type.dart';

class ApiPokemonInfo {
  final String frontDefault;
  final List<ApiPokemonType> types;

  ApiPokemonInfo({required this.frontDefault,required this.types});

  factory ApiPokemonInfo.fromJson(Map<String, dynamic> json) {
    final officialArtwork = json['sprites']['other']['official-artwork'];
    var types = json['types'] as List;
    return ApiPokemonInfo(
        frontDefault: officialArtwork['front_default'] as String,
        types: types.map((i) => ApiPokemonType.fromJson(i['type'])).toList()
    );
  }
}
