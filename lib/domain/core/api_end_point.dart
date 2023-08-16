//! Constant for Url - > TMDB
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  //! Downloads page
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  

  //! Search Page
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

  //! Hot&New Page -> Movie
  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";

  //! Hot&New Page -> Tv
  static const hotAndNewTv = "$kBaseUrl/discover/tv?api_key=$apiKey";


}
