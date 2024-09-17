
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';

class PokemonInfoCard extends StatelessWidget {
  
  final PokemonInfo pokemon;

  const PokemonInfoCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: Card(
          elevation: 4,
          color: Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
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
              )
            ],
          )
      ),
    );
  }
}
