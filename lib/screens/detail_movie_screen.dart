import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pmsn2024/model/popular_model.dart';
import 'package:pmsn2024/network/api_popular.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailMovieScreen extends StatefulWidget {
  DetailMovieScreen({Key? key}) : super(key: key);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
//If the requirement is just to play a single video.
  ApiPopular? api;
  String ytId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api = ApiPopular();
  }

  Widget build(BuildContext context) {
    final popularModel =
        ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(onPressed: ()async{
            var added=await api!.addFavorite(popularModel.id);
            const snackBar = SnackBar(
             content: Text('Ocurrio un problema'),
            );             
            if(added){
            const snackBar = SnackBar(
             content: Text('Movimiento exitoso'),
            );            
            }
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },child: const Icon(Icons.star, color: Colors.white, size: 28),),
        ),        
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${popularModel.posterPath}'),
                  fit: BoxFit.cover)),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              decoration:
                  new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        ListView(children: [
          FutureBuilder(
              future: api!.getMovieTrailer(popularModel.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  var _controller = YoutubePlayerController.fromVideoId(
                    videoId: snapshot.data!,
                    autoPlay: false,
                    params:
                        const YoutubePlayerParams(showFullscreenButton: true),
                  );
                  return Container(
                    width: 300,
                    height: 450,
                    child: YoutubePlayer(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                    ),
                  );
                } else {
                  return Text("No video :()");
                }
              }),
          FutureBuilder(
              future: api!.getMovieCast(popularModel.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return SizedBox(
                      height: MediaQuery.of(context).size.height/4,
                      width: MediaQuery.of(context).size.width/2,                    
                    child: ListView.builder(itemCount: snapshot.data!.length,scrollDirection: Axis.horizontal,itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                              placeholder:
                                  AssetImage('images/cat-orange-cat.gif'),
                              image: NetworkImage('https://image.tmdb.org/t/p/w500/${snapshot.data![index]["profile_path"]}'),
                        ),
                      ));
                  })),
                  );
                } else {
                  return Text("No video :()");
                }
              }),
              RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),           
          FutureBuilder(
              future: api!.getMovieOverview(popularModel.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.height / 3,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(snapshot.data.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  );
                } else {
                  return Text("No video :()");
                }
              }),
        ]),
      ],
    );
  }
}
