// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$batteryLevelAtom =
      Atom(name: '_HomeStore.batteryLevel', context: context);

  @override
  int get batteryLevel {
    _$batteryLevelAtom.reportRead();
    return super.batteryLevel;
  }

  @override
  set batteryLevel(int value) {
    _$batteryLevelAtom.reportWrite(value, super.batteryLevel, () {
      super.batteryLevel = value;
    });
  }

  late final _$getBatteryLevelInfoAsyncAction =
      AsyncAction('_HomeStore.getBatteryLevelInfo', context: context);

  @override
  Future<void> getBatteryLevelInfo() {
    return _$getBatteryLevelInfoAsyncAction
        .run(() => super.getBatteryLevelInfo());
  }

  @override
  String toString() {
    return '''
batteryLevel: ${batteryLevel}
    ''';
  }
}
