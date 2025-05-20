import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
   static  String  apiKey = dotenv.env["APIKEY"]!;
  static const baseURL = 'https://api.themoviedb.org/3/';

   static const trendingMovies = '${baseURL}movie/popular?api_key=';
  static const nowPlayingMovies = '${baseURL}movie/now_playing?api_key=';
  static const topRatedMovies = '${baseURL}movie/top_rated?api_key=';
  static const popularTV = '${baseURL}tv/popular?api_key=';
 }