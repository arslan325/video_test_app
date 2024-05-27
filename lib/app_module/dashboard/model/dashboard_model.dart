// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_app_assignment/utils/constants/app_images.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:flutter/material.dart';

class DashboardBarData {
  String? icon;
  String? title;
  VoidCallback? onTap;
  DashboardBarData({
    this.icon,
    this.title,
    this.onTap,
  });
}

List<DashboardBarData> dashboardBarDataList = [
  DashboardBarData(
    icon: AppImages.HOME_ICON,
    title: AppStrings.DASHBOARD_STRING,
    onTap: () {},
  ),
  DashboardBarData(
    icon: AppImages.WATCH_ICON,
    title: AppStrings.WATCH_STRING,
    onTap: () {},
  ),
  DashboardBarData(
    icon: AppImages.MEDIA_LIBRARY_ICON,
    title: AppStrings.MEDIA_LIBRARY_STRING,
    onTap: () {},
  ),
  DashboardBarData(
    icon: AppImages.MORE_LIST_ICON,
    title: AppStrings.MORE_STRING,
    onTap: () {},
  ),
];
