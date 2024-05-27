import 'package:test_app_assignment/app_module/movie_detail/model/movie_detail_modal.dart';
import 'package:test_app_assignment/utils/constants/api_constant.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class MovieDetailController extends GetxController {
  Rx<MovieDetail> movieDetail = MovieDetail().obs;
  Rx<Trailer> trailer = Trailer().obs;

  getMovieDetail(int id) async {
    movieDetail = MovieDetail().obs;
    update();
    final response = await dio.Dio().get(
      ApiConstant.GET_MOVIVE_DETAILS(id: id.toString()),
    );
    if (response.statusCode == 200) {
      movieDetail.value = MovieDetail.fromJson(response.data);
      update();
      getTrailer(id);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  getTrailer(int id) async {
    trailer = Trailer().obs;
    update();
    final response = await dio.Dio().get(
      ApiConstant.GET_VIDEO(id: id.toString()),
    );
    print(response.data);
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data["results"].length; i++) {
        if (response.data["results"][i]["type"] == "Trailer") {
          trailer.value = Trailer.fromJson(response.data["results"][i]);
          update();
        }
      }
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}
