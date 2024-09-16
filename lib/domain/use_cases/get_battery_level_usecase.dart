
import 'dart:async';

import '../../core/infrastructure/platform/battery_service.dart';
import '../../core/utils/use_cases/use_case.dart';

class GetBatteryLevelUseCase extends UseCase<int, NoParams>{
  final BatteryService _batteryService;

  GetBatteryLevelUseCase(this._batteryService);

  @override
  Future<int> call(NoParams params) async {
    final batteryLevel = await _batteryService.getBatteryLevel();

    if(batteryLevel != null){
      return batteryLevel;
    } else {
      return 0;
    }
  }
}
