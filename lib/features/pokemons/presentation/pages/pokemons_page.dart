import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/presentation/widgets/animated_slide_fade.dart';
import '../../../../core/di/main_di.dart';
import '../stores/pokemons_store.dart';
import '../widgets/pokemon_name_card.dart';

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

  Future<void> _refreshItems() async {
    store.fetchPokemon(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Pokemon List"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/');
            },
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/list_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Observer(
              builder: (_) {
                return RefreshIndicator(
                    onRefresh: _refreshItems,
                    child: Column(
                      children: [
                        Expanded(
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification scrollInfo) {
                                if (!store.hasMore) return false;

                                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !store.isLoading) {
                                  store.fetchPokemon();
                                }
                                return false;
                              },
                              child: AnimatedList(
                                key: _listKey,
                                initialItemCount: store.pokemons.length,
                                itemBuilder: (context, index, animation) {
                                  if(index >= store.pokemons.length){
                                    return const SizedBox.shrink();
                                  } else {
                                    return AnimatedSlideFade(
                                      animation: animation,
                                      child: PokemonNameCard(
                                          pokemon: store.pokemons[index]
                                      ),
                                    );
                                  }
                                },
                              ),
                            )
                        ),
                        if (store.isLoading)
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    )
                );
                },
            )
        )
    );
  }
}
