
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/presentation/widgets/custom_text_with_background.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';

import '../../../../core/utils/string.dart';

class PokemonInfoCard extends StatelessWidget {
  
  final PokemonInfo pokemon;
  final String pokemonName;

  const PokemonInfoCard({super.key, required this.pokemon, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 340,
      child: Card(
          elevation: 4,
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child:
                Text(
                  capitalizeFirstLetter(pokemonName),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(pokemon.types.length, (index) =>
                    CustomTextWithBackground(text: pokemon.types[index])
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Image.network(
                  pokemon.image,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Text('Erro ao carregar a imagem');
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
