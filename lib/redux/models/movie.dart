import 'package:flutter/material.dart';

class Movie {
  
  int id;
  
  bool adult;
  String backdropPath;
  String originalTitle;
  String title;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  double voteAverage;
  String runtime;
  
  Movie({
    @required this.id,
    @required this.adult,
    @required this.title,
    this.overview,
    this.popularity,
    this.backdropPath,
    this.originalTitle,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.runtime
  });

  Movie.fromJson(Map<String, dynamic> json){
    id = json['id'];
    adult =  json['adult'];
    title = json['title'];
    overview = json['overview'];
    popularity = json['popularity'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'];
    runtime = json['runtime'] != null ? (json['runtime']~/60).toStringAsFixed(0) + ":" + (json['runtime']%60).toString() : json['runtime'];
  }

  
}

