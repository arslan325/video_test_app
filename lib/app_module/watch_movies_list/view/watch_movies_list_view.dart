import 'package:test_app_assignment/app_module/watch_movies_list/controller/watch_movie_list_controller.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/view/components/watch_movies_list_components.dart';
import 'package:test_app_assignment/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchMoviesListView extends StatefulWidget {
  const WatchMoviesListView({super.key});

  @override
  State<WatchMoviesListView> createState() => _WatchMoviesListViewState();
}

class _WatchMoviesListViewState extends State<WatchMoviesListView> {
  @override
  void initState() {
    watchController.getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topWidgetOfMoviesList(),
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
                    Obx(() {
                      return watchController.loader.value
                          ? const SizedBox(
                              height: 450,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : listViewOfMovies(watchController.moviesList);
                    })
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
