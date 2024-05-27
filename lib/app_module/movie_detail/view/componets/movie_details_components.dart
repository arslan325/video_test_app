import 'package:test_app_assignment/app_module/movie_detail/model/movie_detail_modal.dart';
import 'package:test_app_assignment/utils/common_widgets/video_player.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/view/components/watch_movies_list_components.dart';
import 'package:test_app_assignment/utils/common_widgets/app_button.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text.dart';
import 'package:test_app_assignment/utils/constants/app_images.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:test_app_assignment/utils/fonts/app_dimensions.dart';
import 'package:test_app_assignment/utils/fonts/app_fonts.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//  Gradient on image

Widget gradientOnImage() {
  return Positioned(
    bottom: 0,
    child: SizedBox(
      height: Get.height / 1.6,
      child: Row(
        children: [
          Container(
            width: Get.width / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
          Container(
            width: Get.width / 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            )),
          )
        ],
      ),
    ),
  );
}

//   Back Button & Title of Image

Widget backWithTitle({String? title}) {
  return Positioned(
    left: 16,
    top: 50,
    child: Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.WHHITE_COLOR,
            size: AppDimensions.FONT_SIZE_19,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        AppText(
            text: title.toString(),
            size: AppDimensions.FONT_SIZE_16,
            fontFamily: FontFamily.medium,
            color: AppColors.WHHITE_COLOR)
      ],
    ),
  );
}

//   Get Ticket & Watch Trailer

Widget buttonsOfMovieDetails({String? videoId, String? date}) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Column(
      children: [
        AppText(
            text: "${AppStrings.THEATERS}${formatDate(date.toString())}",
            color: AppColors.WHHITE_COLOR,
            size: AppDimensions.FONT_SIZE_16,
            fontFamily: FontFamily.medium),
        Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 15),
          child: AppButton(
            buttonName: AppStrings.WATCH_TRAILER,
            iconImage: AppImages.PLAY_ICON,
            isIcon: true,
            iconSize: 14,
            buttonWidth: Get.width / 1.65,
            buttonRadius: BorderRadius.circular(10),
            textSize: AppDimensions.FONT_SIZE_14,
            fontFamily: FontFamily.semiBold,
            buttonColor: Colors.transparent,
            borderColor: AppColors.BLUISH_COLOR,
            borderWidth: 1.5,
            textColor: AppColors.WHHITE_COLOR,
            onTap: () {
              Get.to(
                VideoApp(
                  id: videoId.toString(),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}

//  Time Format

String formatDate(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  String formattedDate = DateFormat(AppStrings.TIME_FORMAT).format(date);
  return formattedDate;
}

//  Overview

Widget overView() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            text: AppStrings.GENRES,
            size: AppDimensions.FONT_SIZE_16,
            fontFamily: FontFamily.medium),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0;
                  i < movieDetailController.movieDetail.value.genres!.length;
                  i++)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: generColors[getColorIndex(i)],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AppText(
                      text: movieDetailController
                          .movieDetail.value.genres![i].name!,
                      size: AppDimensions.FONT_SIZE_12,
                      fontFamily: FontFamily.semiBold,
                      color: AppColors.WHHITE_COLOR),
                )
            ],
          ),
        ),
        Divider(
          height: 40,
        ),
        AppText(
            text: AppStrings.OVERVIEW,
            size: AppDimensions.FONT_SIZE_16,
            fontFamily: FontFamily.semiBold),
        SizedBox(
          height: 10,
        ),
        AppText(
            text: movieDetailController.movieDetail.value.overview!,
            size: AppDimensions.FONT_SIZE_12,
            color: AppColors.GREY_COLOR,
            fontFamily: FontFamily.regular),
      ],
    ),
  );
}
