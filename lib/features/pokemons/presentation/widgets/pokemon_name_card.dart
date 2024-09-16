
import 'package:flutter/material.dart';

import '../../../../domain/entities/pokemon_name.dart';

class PokemonNameCard extends StatelessWidget {

  final PokemonName pokemon;

  const PokemonNameCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Text(pokemon.name);
  }
}
