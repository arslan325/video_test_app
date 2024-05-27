// ignore_for_file: must_be_immutable

import 'package:test_app_assignment/app_module/movie_detail/view/componets/movie_details_components.dart';
import 'package:test_app_assignment/app_module/watch_movies_list/view/components/watch_movies_list_components.dart';
import 'package:test_app_assignment/utils/constants/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetatilView extends StatelessWidget {
  const MovieDetatilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: movieDetailController.movieDetail.value.backdropPath == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height / 1.6,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          ApiConstant.IMAGE_URL +
                              movieDetailController.movieDetail.value.posterPath
                                  .toString(),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        gradientOnImage(),
                        backWithTitle(
                            title: movieDetailController.movieDetail.value.title
                                .toString()),
                        buttonsOfMovieDetails(
                          videoId: movieDetailController.trailer.value.key
                              .toString(),
                          date: movieDetailController
                              .movieDetail.value.releaseDate
                              .toString(),
                        )
                      ],
                    ),
                  ),
                  overView()
                ],
              ),
      );
    });
  }
}
