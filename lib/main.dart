import 'package:flutter/material.dart';
import 'anime_details.dart';
import 'display_layout.dart';
import 'random_anime.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  var randomAnimeGenerator = RandomAnime();
  late AnimeDetails character;

  Home({super.key}) {
    character = randomAnimeGenerator.getAnime();
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Center(
              child: Text(
            "ANIME INFO",
            style: TextStyle(color: Colors.white70),
          )),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 72.0,
            width: 200.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    widget.character = widget.randomAnimeGenerator.getAnime();
                  });
                },
                backgroundColor: Colors.grey[850],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                  child: const Text("Random Anime", style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.lightBlueAccent,
                  ),),
              ),
            ),
          ),
        ),
        body: DisplayLayout(
          character: widget.character,
        ));
  }
}
