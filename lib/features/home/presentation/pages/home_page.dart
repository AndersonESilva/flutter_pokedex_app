import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex_app/features/home/presentation/stores/home_store.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/main_di.dart';

import '../widgets/energy_bar_card.dart';
import '../widgets/pokemon_button.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();
    store.getBatteryLevelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
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
                    EnergyBarCard(power: store.batteryLevel.toDouble()),
                    PokemonButton(
                      onPressed: () {
                        context.go('/pokemons');
                      },
                    )
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}