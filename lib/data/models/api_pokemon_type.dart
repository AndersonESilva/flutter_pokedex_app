
class ApiPokemonType {
  final String name;

  ApiPokemonType({required this.name});

  factory ApiPokemonType.fromJson(Map<String, dynamic> json) {
    return ApiPokemonType(name: json['name']);
  }
}
