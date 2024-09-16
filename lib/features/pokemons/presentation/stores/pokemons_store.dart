
import 'package:flutter_pokedex_app/domain/use_cases/get_pokemons_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/entities/pokemon_name.dart';

part 'pokemons_store.g.dart';

class PokemonsStore = _PokemonsStore with _$PokemonsStore;

abstract class _PokemonsStore with Store {
  final GetPokemonsUseCase getPokemons;
  final int _itemsPerPage = 20;
  int _currentPage = 1;

  _PokemonsStore(this.getPokemons);

  @observable
  ObservableList<PokemonName> pokemons = ObservableList<PokemonName>();

  @observable
  bool isLoading = false;

  @observable
  bool errorExecuted = false;

  @observable
  bool hasMore = true;

  Function(int)? pokemonAdded;

  @action
  Future<void> fetchPokemon({bool refresh = false}) async {
    runInAction(() async {

      if (refresh) {
        _currentPage = 1;
        pokemons.clear();
        hasMore = true;
      }

      isLoading = true;
      errorExecuted = false;

      final result = await getPokemons.call(GetPokemonsParams(_itemsPerPage, _currentPage));

      if (result.isSuccess) {
        final newPokemons = result.value as List<PokemonName>;
        if (newPokemons.isEmpty) {
          hasMore = false;
        } else {
          for (var i = 0; i < newPokemons.length; i++) {
            final index = pokemons.length;
            pokemons.add(newPokemons[i]);
            pokemonAdded?.call(index);
          }

          if(newPokemons.length < _itemsPerPage){
            hasMore = false;
          }
          _currentPage++;
        }
      } else if (result.isError) {
        errorExecuted = true;
      }

      isLoading = false;
    });
  }
}
