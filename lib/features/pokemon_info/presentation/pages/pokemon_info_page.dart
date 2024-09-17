
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/widgets/pokemon_info_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/main_di.dart';
import '../stores/pokemon_info_store.dart';

class PokemonInfoPage extends StatefulWidget {
  final String pokemonName;

  PokemonInfoPage({required this.pokemonName});

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfoPage> {
  final PokemonInfoStore store = getIt<PokemonInfoStore>();

  @override
  void initState() {
    super.initState();
    store.getPokemonInfo(widget.pokemonName);
  }

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
                  if(store.pokemon != null)
                    PokemonInfoCard(pokemon: store.pokemon!)
                ],
              ),
            );
          }),
      ),
    );
  }

}