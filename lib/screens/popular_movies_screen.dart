import 'package:flutter/material.dart';
import 'package:pmsn2024/model/popular_model.dart';
import 'package:pmsn2024/network/api_popular.dart';


class popularMoviesScreen extends StatefulWidget {
  popularMoviesScreen({Key? key}) : super(key: key);

  @override
  _popularMoviesScreenState createState() => _popularMoviesScreenState();
}

class _popularMoviesScreenState extends State<popularMoviesScreen> {
  ApiPopular? apiPopular;
   @override
  void initState() {
    // TODO: implement initState
     super.initState();
        apiPopular=ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiPopular!.getPopularMovie(), builder: (context,AsyncSnapshot<List<PopularModel>?> snapshot){
        if(snapshot.hasData){
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/detail",arguments: snapshot.data![index]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('images/cat-orange-cat.gif'),
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}')),
                ),
              );
            }),
          );
        }else{
          if(snapshot.hasError){
            return Center(child: Text("Error"));
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      },
      ),
    );
  }
}