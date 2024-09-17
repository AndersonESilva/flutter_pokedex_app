
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class PokemonInfoPage extends StatefulWidget {
  final String pokemonName;

  PokemonInfoPage({required this.pokemonName});

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/info_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Observer(
          builder: (_) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.go('/pokemons');
                    },
                  ),

                ],
              ),
            );
          }),
      ),
    );
  }

}