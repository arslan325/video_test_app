import 'package:test_app_assignment/app_module/search_movie/view/components/search_movie_components.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/controller/watch_movie_list_controller.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMovieView extends StatelessWidget {
  SearchMovieView({super.key});

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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                   const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () {
                        return watchController.searchText.value.isEmpty
                            ? gridViewOfMovies(watchController.moviesList)
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: searchedMoviesList(
                                  watchController.searched,
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
