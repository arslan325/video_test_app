import 'package:test_app_assignment/app_module/dashboard/view/dashboard_view.dart';
import 'package:test_app_assignment/app_module/movie_detail/view/movie_detail_view.dart';
import 'package:get/get.dart';
import 'package:test_app_assignment/app_module/search_movie/view/search_movie_view.dart';

class Routes {
  static final routes = [
    GetPage(
      name: "/",
      page: () => DashboardView(),
    ),
    GetPage(
      name: "/detail",
      page: () => const MovieDetatilView(),
    ),
    GetPage(
      name: "/search",
      page: () => SearchMovieView(),
    ),
  ];
}
