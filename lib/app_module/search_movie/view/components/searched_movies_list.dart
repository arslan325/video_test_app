// ignore_for_file: must_be_immutable

import 'package:test_app_assignment/app_module/search_movie/view/components/search_movie_components.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/controller/watch_movie_list_controller.dart';
import 'package:test_app_assignment/utils/common_widgets/app_text.dart';
import 'package:test_app_assignment/utils/constants/const_strings.dart';
import 'package:test_app_assignment/utils/fonts/app_dimensions.dart';
import 'package:test_app_assignment/utils/fonts/app_fonts.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchedMoviesListView extends StatelessWidget {
  SearchedMoviesListView({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topWidgetOfSearchMovie(),
          Expanded(
            child: Container(
              color: AppColors.BACKGROUND_COLOR,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      AppText(
                          text: AppStrings.TOP_RESULT,
                          size: AppDimensions.FONT_SIZE_12,
                          fontFamily: FontFamily.medium),
                      Divider(
                        height: 30,
                      ),
                      Obx(
                        () {
                          return searchedMoviesList(watchController.moviesList);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
