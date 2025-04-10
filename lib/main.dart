import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'services/api_service.dart';
import 'utils/constants.dart';
import 'screens/movie_detail_page.dart';

void main() => runApp(MovieApp());

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData.dark(),
      home: MovieListPage(),
    );
  }
}

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late Future<List<dynamic>> movies;

  @override
  void initState() {
    super.initState();
    movies = ApiService.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular Movies")),
      body: FutureBuilder<List<dynamic>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No movies found"));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data![index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie)),
                ),
                child: Card(
                  child: Column(
                    children: [
                      CachedNetworkImage(imageUrl: "$imageBaseUrl${movie['poster_path']}", height: 180, fit: BoxFit.cover),
                      Padding(padding: EdgeInsets.all(8), child: Text(movie['title'], textAlign: TextAlign.center))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
