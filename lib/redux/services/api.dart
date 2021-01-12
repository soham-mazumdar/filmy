import 'dart:convert';
import 'dart:io';
import 'package:filmy/redux/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String _baseURL = "api.themoviedb.org";
  final String apiKey= "101b302c3b637169c94a015fe4457d71";
  
  /// gets movies NowPlaying
  Future<List<Movie>> getNowPlaying() async {
    List<Movie> movies = [];
    var queryParameters = {'api_key': apiKey};
    Uri uri = Uri.https(_baseURL,'/3/movie/now_playing',queryParameters);
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri,headers: header);
    Map<String, dynamic> body = json.decode(response.body);
    List results = body['results'];
    
    for (var result in results) {
      movies.add(Movie.fromJson(result));
    }
    return movies;
  }

  /// gets details of single movie
  Future<Movie> getDetails(int movieId) async {
    Movie movie;

    var queryParameters = {'api_key': apiKey};//,'movie_id': movieId.toString()};
    Uri uri = Uri.https(_baseURL,'/3/movie/'+movieId.toString(),queryParameters);
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri,headers: header);
    
    Map<String, dynamic> body = json.decode(response.body);
    movie = Movie.fromJson(body);
    return movie;
  }
  
  /// gets movies TopRated
  Future<List<Movie>> getTop() async {
    List<Movie> movies = [];
    var queryParameters = {'api_key': apiKey};
    Uri uri = Uri.https(_baseURL,'/3/movie/top_rated',queryParameters);
    Map<String, String> header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri,headers: header);
    Map<String, dynamic> body = json.decode(response.body);
    List results = body['results'];
    
    for (var result in results) {
      movies.add(Movie.fromJson(result));
    }
    return movies;
  }


}