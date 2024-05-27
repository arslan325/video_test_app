import 'package:test_app_assignment/app_module/dashboard/controller/dashboard_controller.dart';
import 'package:test_app_assignment/app_module/dashboard/model/dashboard_model.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/view/watch_movies_list_view.dart';
import 'package:test_app_assignment/utils/Fonts/app_dimensions.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///      Bottom Bar Widget of Dashboard

Widget bottomBarWidget({required DashboardController controller}) {
  return Container(
    height: 75,
    width: Get.width,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    decoration: BoxDecoration(
        color: AppColors.PUPLE_COLOR,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < dashboardBarDataList.length; i++)
          InkWell(
            onTap: () {
              controller.updateBottomSelectedIndex(i);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    dashboardBarDataList[i].icon!,
                    color: controller.bottomSelectedIndex.value == i
                        ? AppColors.WHHITE_COLOR
                        : AppColors.GREY_COLOR,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                  text: dashboardBarDataList[i].title!,
                  size: AppDimensions.FONT_SIZE_10,
                  color: controller.bottomSelectedIndex.value == i
                      ? AppColors.WHHITE_COLOR
                      : AppColors.GREY_COLOR,
                )
              ],
            ),
          )
      ],
    ),
  );
}

///      Main Widgets of Dashboard

Widget mainViewOfWidgets({required DashboardController controller}) {
  List<Widget> mainWidgetsList = [
    Center(
      child: AppText(text: AppStrings.COMING_SOON),
    ),
    WatchMoviesListView(),
    Center(
      child: AppText(text: AppStrings.COMING_SOON),
    ),
    Center(
      child: AppText(text: AppStrings.COMING_SOON),
    ),
  ];
  return mainWidgetsList[controller.bottomSelectedIndex.value];
}
