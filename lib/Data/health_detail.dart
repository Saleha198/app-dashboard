import 'package:dash_board/model/health_model.dart';

class HealthDetail {
  final List<HealthModel> healthData = const [
    HealthModel(
      icon: 'assets/icons/burn.png',
      value: "30",
      title: "Project success",
    ),
    HealthModel(
      icon: 'assets/icons/steps.png',
      value: "10,983",
      title: "Units ",
    ),
    HealthModel(
      icon: 'assets/icons/distance.png',
      value: "70",
      title: "Salesperson",
    ),
    HealthModel(
      icon: 'assets/icons/sleep.png',
      value: "18",
      title: "Approved",
    ),
    // Add more items if needed
  ];
}
