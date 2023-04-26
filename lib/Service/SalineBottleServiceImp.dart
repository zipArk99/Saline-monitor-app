import 'package:saline_monitor/Models/SalineBottle.dart';
import 'package:saline_monitor/Service/SalineBottleServiceInterface.dart';


class SalinBottleServiceImp implements SalinBottleServiceInterface{
  List<SalineBottle> salinBottleList = [
    SalineBottle(
      salineBottleId: "10",
      bedNumber: "156",
      salinLevel: 20.26,
    ),
    SalineBottle(
      salineBottleId: "20",
      bedNumber: "150",
      salinLevel: 21.26,
    ),
    SalineBottle(
      salineBottleId: "40",
      bedNumber: "170",
      salinLevel: 25.22,
    ),
  ];
}
