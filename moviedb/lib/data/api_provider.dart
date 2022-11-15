import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:moviedb/popular_movies.dart';
import 'package:moviedb/popular_movies.dart';

class ApiProvider {
  String apiKey = 'ef35bc3c5ad655682cd6f9f8a7d038bb';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}