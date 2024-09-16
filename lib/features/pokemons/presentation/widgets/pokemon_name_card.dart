
import 'package:flutter/material.dart';

import '../../../../domain/entities/pokemon_name.dart';

class PokemonNameCard extends StatelessWidget {

  final PokemonName pokemon;

  const PokemonNameCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: Center(
          child: Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 18
              )),
        )),
    );
  }
}
