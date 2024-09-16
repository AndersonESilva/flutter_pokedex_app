import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex_app/features/home/presentation/stores/home_store.dart';

import '../../../../core/di/main_di.dart';

import '../../../../core/di/main_di.dart';

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
      body: Observer(
        builder: (_) {
          return Center(
            child: Text('Seu nivel de poder é seu nivel de bateria: ${store.batteryLevel.toString()}'),
          );
        }
      ),
    );
  }
}