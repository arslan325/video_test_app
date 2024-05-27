import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app_assignment/app_module/movie_detail/controller/movie_detail_controller.dart';
import 'package:test_app_assignment/app_module/search_movie/view/search_movie_view.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/model/watch_movie_modal.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text.dart';
import 'package:test_app_assignment/utils/constants/api_constant.dart';
import 'package:test_app_assignment/utils/constants/app_images.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:test_app_assignment/utils/fonts/app_dimensions.dart';
import 'package:test_app_assignment/utils/fonts/app_fonts.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///    Top Widget Of Watch Movies List

Widget topWidgetOfMoviesList() {
  return Container(
    height: Get.height / 8,
    width: Get.width,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.LIGHT_GREY_COLOR,
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  text: AppStrings.WATCH_STRING,
                  size: AppDimensions.FONT_SIZE_16,
                  fontFamily: FontFamily.medium),
              IconButton(
                onPressed: (){
                 Get.toNamed("/search");
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

/// Movie Card

Widget movieCard({String? imageUrl, String? title}) {
  return Container(
    height: Get.height / 4,
    margin: const EdgeInsets.only(bottom: 16),
    width: Get.width,
    decoration: BoxDecoration(
      color: AppColors.BLUISH_COLOR,
      borderRadius: BorderRadius.circular(15),
      image: imageUrl == null
          ? const DecorationImage(
              image: AssetImage("assets/images/movie_image.png"),
              fit: BoxFit.cover)
          : DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 80,
          width: Get.width,
          padding: const EdgeInsets.only(left: 20, bottom: 20, top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.transparent,
              ],
            ),
          ),
          child: AppText(
              text: title ?? "",
              color: AppColors.WHHITE_COLOR,
              size: AppDimensions.FONT_SIZE_18,
              fontFamily: FontFamily.medium),
        )
      ],
    ),
  );
}

MovieDetailController movieDetailController = Get.put(
  MovieDetailController(),
);

///  List View of Movies

Widget listViewOfMovies(List<Movie> moviesList) {
  return ListView.builder(
    itemCount: moviesList.length,
    shrinkWrap: true,
    primary: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          movieDetailController.getMovieDetail(
            moviesList[index].id!,
          );
          Get.toNamed("/detail");
        },
        child: movieCard(
          imageUrl: ApiConstant.IMAGE_URL + moviesList[index].backdropPath!,
          title: moviesList[index].originalTitle!,
        ),
      );
    },
  );
}
