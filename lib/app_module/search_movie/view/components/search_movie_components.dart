import 'package:test_app_assignment/app_module/watch_movies_list/controller/watch_movie_list_controller.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/model/watch_movie_modal.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/view/components/watch_movies_list_components.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text_field.dart';
import 'package:test_app_assignment/utils/constants/api_constant.dart';
import 'package:test_app_assignment/utils/constants/app_images.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:test_app_assignment/utils/fonts/app_dimensions.dart';
import 'package:test_app_assignment/utils/fonts/app_fonts.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

///    Top Widget Of Watch Movies List

Widget topWidgetOfSearchMovie() {
  return Container(
    height: Get.height / 8,
    width: Get.width,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: AppColors.LIGHT_GREY_COLOR,
    ))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppTextField(
          hint: AppStrings.SEARCH_HINT,
          hintSize: AppDimensions.FONT_SIZE_15,
          controller: watchController.searchController.value,
          hintColor: AppColors.GREY_COLOR,
          isborderline: true,
          maxLines: 1,
          borderColor: Colors.transparent,
          isFill: true,
          fillColor: AppColors.LIGHT_GREY_COLOR,
          borderRadius: BorderRadius.circular(30),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          isPrefix: true,
          onChange: (val) {
            watchController.updateSearchText(val ?? "");
            print(val.toString());
          },
          prefixIcon: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(13),
            child: Image.asset(
              AppImages.SEARCH_ICON,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {
              if (watchController.searchText.value.isNotEmpty) {
                watchController.searchController.value.clear();
                watchController.updateSearchText("");
              } else {
                Get.back();
              }
            },
            child: Container(
              height: 25,
              width: 25,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                AppImages.CLOSE_ICON,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

///  List View of Movies

Widget gridViewOfMovies(List<Movie> movieList) {
  return GridView.builder(
    itemCount: movieList.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.symmetric(horizontal: 16),
    primary: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 0,
        childAspectRatio: 1.45),
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          movieDetailController.getMovieDetail(
            movieList[index].id!,
          );
          Get.toNamed("/detail");
        },
        child: gridSizeMovieCard(
          imageUrl: ApiConstant.IMAGE_URL + movieList[index].backdropPath!,
          title: movieList[index].originalTitle!,
        ),
      );
    },
  );
}

/// Grid Size Movie Card

Widget gridSizeMovieCard({String? imageUrl, String? title}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    width: Get.width,
    decoration: BoxDecoration(
      color: AppColors.BLUISH_COLOR,
      borderRadius: BorderRadius.circular(15),
      image: imageUrl == null
          ? DecorationImage(
              image: AssetImage("assets/images/movie_image.png"),
              fit: BoxFit.cover)
          : DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 70,
            width: Get.width,
            padding: const EdgeInsets.only(left: 20, bottom: 20, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AppText(
                text: title ?? "",
                color: AppColors.WHHITE_COLOR,
                size: AppDimensions.FONT_SIZE_16,
                fontFamily: FontFamily.medium),
          )
        ],
      ),
    ),
  );
}

//  Searched Movies List

Widget searchedMoviesList(List<Movie> moviesList) {
  return ListView.builder(
    itemCount: moviesList.length,
    shrinkWrap: true,
    primary: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 13),
        child: InkWell(
          onTap: () {
            movieDetailController.getMovieDetail(
              moviesList[index].id!,
            );
            Get.toNamed("/detail");
          },
          child: searchedMovieCard(
            imageUrl: ApiConstant.IMAGE_URL + moviesList[index].backdropPath!,
            title: moviesList[index].originalTitle!,
            subTitle: DateFormat(AppStrings.TIME_FORMAT).format(
              moviesList[index].releaseDate!,
            ),
          ),
        ),
      );
    },
  );
}

//  Searched Movie Card

Widget searchedMovieCard({String? imageUrl, String? title, String? subTitle}) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 90,
          width: 130,
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width / 2,
            child: AppText(
              text: title!,
              overflow: TextOverflow.ellipsis,
              size: AppDimensions.FONT_SIZE_16,
              fontFamily: FontFamily.medium,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          AppText(
              text: subTitle!,
              size: AppDimensions.FONT_SIZE_12,
              color: AppColors.GREY_COLOR.withOpacity(.5),
              fontFamily: FontFamily.medium)
        ],
      ),
      const Spacer(),
      Icon(
        Icons.more_horiz,
        color: AppColors.BLUISH_COLOR,
      )
    ],
  );
}
