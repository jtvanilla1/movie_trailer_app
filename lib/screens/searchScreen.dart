import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer_app/components/mediaBtn.dart';
import 'package:mao_trailer_app/components/movie.dart';
import 'package:mao_trailer_app/components/mediaGridView.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<MediaBtn> mediaList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          //back button
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back), 
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          //searchbar
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SearchBar<Movie>(
                onSearch: searchMovie,
                onItemFound: (Movie movie, int index) {
                  //build mediaList based on movies
                  

                  //display gridview of MediaBtns based on search value
                  //buildMediaGridView(context, mediaList);
                  return ListTile(
                    title: Text(movie.originalTitle),
                    subtitle: Text(movie.overview),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}