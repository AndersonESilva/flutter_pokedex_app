
import 'dart:async';

import '../../core/utils/tool/battery_tool.dart';
import '../../core/utils/use_cases/use_case.dart';

class GetBatteryLevelUseCase extends UseCase<int, NoParams>{
  final BatteryTool _batteryTool;

  GetBatteryLevelUseCase(this._batteryTool);

  @override
  Future<int> call(NoParams params) async {
    final batteryLevel = await _batteryTool.getBatteryLevel();

    if(batteryLevel != null){
      return batteryLevel;
    } else {
      return 0;
    }
  }
}
