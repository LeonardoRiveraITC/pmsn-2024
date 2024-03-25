import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2024/model/popular_model.dart';

class ApiPopular {
  Future<List<PopularModel>?> getPopularMovie() async{
  var URL="https://api.themoviedb.org/3/movie/popular?api_key=9942375ca85ac9f07a717c2a0e236169&language=es-MX&page=1";
  var dio=Dio();    
    Response response= await dio.get(URL);
    if(response.statusCode==200){  
      final listMoviesMap = response.data["results"] as List;
      return listMoviesMap.map((movie) => PopularModel.fromMap(movie)).toList();
    }
    return null;
  }
  Future <String> getMovieTrailer(id) async{
  var URL="https://api.themoviedb.org/3/movie/${id}/videos?api_key=9942375ca85ac9f07a717c2a0e236169";
  var dio=Dio();

    Response response= await dio.get(URL);
    
    if(response.statusCode==200){  
      final movieTrailer = response.data["results"];
      if(movieTrailer[0]["site"]=="YouTube"){
        return movieTrailer[0]["key"];
      }else{
        return 'ZWcRmoLqhkc';
      }
    }
    return 'ZWcRmoLqhkc';
  }
 Future <List?> getMovieCast(id) async{
  var URL="https://api.themoviedb.org/3/movie/${id}/credits?api_key=9942375ca85ac9f07a717c2a0e236169";
  var dio=Dio();
    print("cast");
    Response response= await dio.get(URL);
    print(response.data);
    if(response.statusCode==200){  
      final movieTrailer = response.data["cast"] as List;
      return movieTrailer;
    }
    
  }  
  Future <String?> getMovieOverview(id) async{
  var URL="https://api.themoviedb.org/3/movie/${id}?api_key=9942375ca85ac9f07a717c2a0e236169";
  var dio=Dio();    
    Response response= await dio.get(URL);
    if(response.statusCode==200){  
      final movie= response.data["overview"];
        print(movie);
        return movie;
      }
      return null;
    }
  Future <double?> getMovieReviews(id) async{
  var URL="https://api.themoviedb.org/3/movie/${id}/reviews?api_key=9942375ca85ac9f07a717c2a0e236169";
  var dio=Dio();    
    Response response= await dio.get(URL);
    if(response.statusCode==200){  
      final movie= response.data["results"] as List;
        print(movie);
        double rev=0;
        movie.forEach((element) {
          if(element["rating"]){
            rev+=element["rating"];
          }
         });
        return rev/2;
      }
      return null;
    }


  Future <bool> addFavorite(id) async{
      var URL="https://api.themoviedb.org/3/account/20601814/favorite?api_key=9942375ca85ac9f07a717c2a0e236169&session_id=e0e9b1866d0a9debccfa3892613e774388c60436";
    var dio=Dio();    
    Response response= await dio.post(URL,  options: Options(headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    }),
    data: jsonEncode({
    "media_type": "movie",
    "media_id": id,
    "favorite": true
    }),);
    if(response.statusCode==200){
      return true; 
    }
    return false;
  }
  Future <bool> removeFavorite(id) async{
      var URL="https://api.themoviedb.org/3/account/20601814/favorite?api_key=9942375ca85ac9f07a717c2a0e236169&session_id=e0e9b1866d0a9debccfa3892613e774388c60436";
    var dio=Dio();    
    Response response= await dio.post(URL,  options: Options(headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    }),
    data: jsonEncode({
    "media_type": "movie",
    "media_id": id,
    "favorite": false
    }),);
    if(response.statusCode==200){
      return true; 
    }
    return false;
  }  
}