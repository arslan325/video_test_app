import 'package:test_app_assignment/app_module/dashboard/controller/dashboard_controller.dart';
import 'package:test_app_assignment/app_module/dashboard/view/components/dashboard_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
            mainAxisAlignment: dashboardController.loader.value
                ? MainAxisAlignment.start
                : MainAxisAlignment.start,
            children: [
              Expanded(
                  child: mainViewOfWidgets(controller: dashboardController)),
              bottomBarWidget(controller: dashboardController)
            ]);
      }),
    );
  }
}
