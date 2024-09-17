
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/widgets/pokemon_info_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/presentation/widgets/error_row_widget.dart';
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
  void dispose() {
    super.dispose();
    store.pokemon = null;
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
                  if(store.errorExecuted)
                    const ErrorRowWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 32,
                          color: Colors.black,
                          onPressed: () {
                            context.go('/pokemons');
                          },
                        ),
                        const Spacer()
                      ],
                  )
                  ),
                  if(store.pokemon != null)
                    PokemonInfoCard(pokemon: store.pokemon!, pokemonName: widget.pokemonName)
                  else if(store.pokemon == null || store.isLoading)
                    const CircularProgressIndicator()
                ],
              ),
            );
          }),
      ),
    );
  }
}
