import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex_app/core/di/stores_di.dart';

import '../stores/pokemons_store.dart';

class PokemonsPage extends StatefulWidget {

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final PokemonsStore store = getIt<PokemonsStore>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    store.fetchPokemon();
    store.pokemonAdded = _onPokemonAdded;
  }

  Future<void> _onPokemonAdded(int index) async {
    await Future.delayed(Duration(milliseconds: 200 * index), () {
      _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 1500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Pokemon List"),
      ),
      body: Observer(
        builder: (_) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
                if (!store.hasMore) return false;

                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  store.fetchPokemon();
                }
                return false;
              },
            child: AnimatedList(
              key: _listKey,
              initialItemCount: store.pokemons.length,
              itemBuilder: (context, index, animation) {
                if (index >= store.pokemons.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                final pokemon = store.pokemons[index];
                return _buildAnimatedItem(pokemon.name, animation);
              },
            ),
          );
        },
      )
    );
  }

  Widget _buildAnimatedItem(String name, Animation<double> animation) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return SlideTransition(
      position: curvedAnimation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ),
      ),
      child: FadeTransition(
        opacity: curvedAnimation,
        child: ListTile(
          title: Text(name),
        ),
      ),
    );
  }
}
