import 'package:project_management/app/features/training-details/views/screens/training_details_screen.dart';

import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;
  static const trainingDetails = Routes.trainingDetails;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.trainingDetails,
      page: () => const TrainingDetailsScreen(),
      binding: TrainingDetailsBinding(),
    ),
  ];
}
