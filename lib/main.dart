import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MovieHomePage(),
    );
  }
}

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  final List<Map<String, String>> nowPlaying = const [
  {"title": "Deadpool", "image": "assets/image/deadpool.jpg"},
  {"title": "Zootopia", "image": "assets/image/zootopia.jpg"},
  {"title": "Inception", "image": "assets/image/inception.jpg"},
];

final List<Map<String, String>> trending = const [
  {"title": "Avengers Endgame", "image": "assets/image/avengers end game.jpg"},
  {"title": "John Wick 4", "image": "assets/image/john wick 4.jpg"},
  {"title": "Black Panther", "image": "assets/image/black panther.jpg"},
  {"title": "Joker", "image": "assets/image/joker.jpg"},
];

final List<Map<String, String>> popular = const [
  {"title": "Frozen II", "image": "assets/image/frozen ii.jpg"},
  {"title": "Spider-Man", "image": "assets/image/spiderman.jpg"},
  {"title": "The Batman", "image": "assets/image/the batman.jpg"},
  {"title": "Encanto", "image": "assets/image/encanto.jpg"},
];

final List<Map<String, String>> topRated = const [
  {"title": "Interstellar", "image": "assets/image/interstellar.jpg"},
  {"title": "The Dark Knight", "image": "assets/image/the dark knight.jpg"},
  {"title": "Fight Club", "image": "assets/image/fight club.jpg"},
  {"title": "Forrest Gump", "image": "assets/image/forrest gump.jpg"},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('🎬 Movie App'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOW PLAYING
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Now Playing",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
              items: nowPlaying.map((movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            movie["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie["title"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),

            // TRENDING
            buildMovieSection("Trending", trending),

            // POPULAR
            buildMovieSection("Popular", popular),

            // TOP RATED
            buildMovieSection("Top Rated", topRated),
          ],
        ),
      ),
    );
  }

  Widget buildMovieSection(String title, List<Map<String, String>> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const Text("More",
                  style: TextStyle(color: Colors.redAccent, fontSize: 14)),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                width: 120,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movie["image"]!,
                        height: 140,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie["title"]!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
