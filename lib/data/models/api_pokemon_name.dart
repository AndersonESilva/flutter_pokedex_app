
class ApiPokemonName {
  final String name;

  ApiPokemonName({required this.name});

  factory ApiPokemonName.fromJson(Map<String, dynamic> json) {
    return ApiPokemonName(
      name: json['name']
    );
  }
}
