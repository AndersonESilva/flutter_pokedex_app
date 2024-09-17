
import 'package:mobx/mobx.dart';

import '../../../../domain/entities/pokemon_info.dart';
import '../../../../domain/use_cases/get_pokemon_info_usecase.dart';

part 'pokemon_info_store.g.dart';

class PokemonInfoStore = _PokemonInfoStore with _$PokemonInfoStore;

abstract class _PokemonInfoStore with Store {
  final GetPokemonInfoUseCase getPokemon;

  _PokemonInfoStore(this.getPokemon);

  @observable
  PokemonInfo? pokemon;

  @observable
  bool isLoading = false;

  @observable
  bool errorExecuted = false;

  @action
  Future<void> getPokemonInfo(String name) async {
    runInAction(() async {

      isLoading = true;
      errorExecuted = false;

      final result = await getPokemon.call(name);

      if (result.isSuccess) {
        pokemon = result.value as PokemonInfo;
      } else if (result.isError) {
        errorExecuted = true;
      }

      isLoading = false;
    });
  }
}
