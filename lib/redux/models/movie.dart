import 'package:flutter/material.dart';

class Movie {
  
  int id;//	657811
  
  bool adult;
  String backdropPath;
  String originalTitle;//	"Lassie - Eine abenteuerliche Reise"
  String title;//	"Lassie Come Home"
  String overview;//	"Remake of 1943 movie based on Eric Knight's book, \"Lassie Come Home\""
  double popularity;//	307.756
  String posterPath;//	"/82yxvnYtgeRzsq5f9USlrFJI05s.jpg"
  String releaseDate;//	"2020-02-20"
  double voteAverage;//	7.2
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

  // Map<String, dynamic> toJson(){
    // return {
    //   "id": this.id,
    //   "body": this.body,
    //   "author": this.author,
    // };
  // }

  
}

