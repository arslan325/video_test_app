import 'package:test_app_assignment/app_module/watch_movies_list/model/watch_movie_modal.dart';
import 'package:test_app_assignment/utils/constants/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class WatchMovieListController extends GetxController {
  var loader = false.obs;
  RxList<Movie> moviesList = <Movie>[].obs;
  RxList<Movie> searched = <Movie>[].obs;
  var searchController = TextEditingController().obs;

  var searchText = "".obs;
  updateSearchText(String text) {
    searchText.value = text;
    searched.clear();
    update();
    for (var i = 0; i < moviesList.length; i++) {
      if (moviesList[i].title!.toLowerCase().contains(text.toLowerCase())) {
        searched.add(
          moviesList[i],
        );
        update();
      }
    }
  }

  getUpcomingMovies() async {
    moviesList.clear();
    loader(true);
    await dio.Dio()
        .get(
      ApiConstant.BASE_URL + ApiConstant.UPCOMING,
    )
        .then((response) {
      loader(false);
      if (response.statusCode == 200) {
        for (var i = 0; i < response.data["results"].length; i++) {
          moviesList.add(
            Movie.fromJson(
              response.data["results"][i],
            ),
          );
          update();
        }
        print(moviesList[0].overview);
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    });
  }
}

WatchMovieListController watchController = Get.put(
  WatchMovieListController(),
);
