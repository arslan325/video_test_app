// ignore_for_file: non_constant_identifier_names

class ApiConstant {
  /// base url
  static const String BASE_URL = 'https://api.themoviedb.org/3/movie/';

  /// image url
  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500";

  /// api key
  static const String API_KEY = 'f0a234c9b147a5779664626d8ad0a2f4';

  /// Other API Points
  static const String UPCOMING = 'upcoming?api_key=$API_KEY';
  static String GET_MOVIVE_DETAILS({String? id}) {
    return "https://api.themoviedb.org/3/movie/$id?api_key=${API_KEY}";
  }

  static String GET_VIDEO({String? id}) {
    return "https://api.themoviedb.org/3/movie/$id/videos?api_key=${API_KEY}";
  }
}
