import 'package:flutter/material.dart';
import 'package:moodie/screens/description_screen.dart';
import 'package:moodie/screens/profile.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../services/authService.dart';
import 'authentication/wrapper.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AuthService _auth = AuthService();

  // API Key
  String apiKey = '652e669e27d3194e4697e41bfbf91c64';

  // Access Token
  String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTJlNjY5ZTI3ZDMxOTRlNDY5N2U0MWJmYmY5MWM2NCIsInN1YiI6IjY0MmI5Yzk4YTNlNGJhMzI0OGQ4N2U2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QWVaw5MEsD6NYk50SB6u0GT-PQrQoGvNOIDnCiY9Y6g';

  List trendingMovies = [];

  List topratedMovies = [];

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingMovies = trendingResult['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(112, 29, 83, 1),
              Color.fromRGBO(30, 30, 30, 1)
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 90,
            flexibleSpace: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 40,
                    semanticLabel:
                        'Three horizontal dots, indicating more options available',
                  ),
                  Text(
                    'Moodie',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(2, 1),
                              blurRadius: 15),
                        ],
                        color: const Color.fromRGBO(207, 184, 66, 1),
                        fontFamily: 'Leckerli One',
                        fontSize: 64,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3.0),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      icon: Image.asset('./assets/images/avatar.png'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _auth.isLoggedIn()
                                ? const Profile()
                                : const AuthWrapper(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    /*TODO controller:,*/
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 5.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(112, 29, 83, 1),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromRGBO(112, 29, 83, 1),
                        ),
                        onPressed: /*TODO: Search screen (https://flutterassets.com/search-bar-in-flutter/)*/
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        },
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(112, 29, 83, 1),
                        ),
                        onPressed: /*TODO: Search screen (https://flutterassets.com/search-bar-in-flutter/)*/
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  'SUGGESTED MOVIES',
                  style: TextStyle(
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color.fromRGBO(112, 29, 83, 1),
                    ),
                    child: ListView.builder(
                      itemCount: trendingMovies.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescriptionScreen(
                                name: trendingMovies[index]['title'].toString(),
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trendingMovies[index]['poster_path'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trendingMovies[index]['backdrop_path'],
                                description: trendingMovies[index]['overview'],
                                vote: trendingMovies[index]['vote_average']
                                    .toString(),
                                launch_on: trendingMovies[index]
                                    ['release_date'].toString(),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Container(
                              alignment: const Alignment(1.1, 1.0),
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trendingMovies[index]['poster_path']),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 5.0, 10.0, 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: const Color.fromRGBO(207, 185, 66, 1),
                                ),
                                child: trendingMovies[index]['title'] != null
                                    ? Text(
                                        trendingMovies[index]['title'],
                                        style: const TextStyle(
                                          fontFamily: 'Josefin Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color.fromRGBO(112, 29, 83, 1),
                                        ),
                                      )
                                    : const Text(
                                        'Loading',
                                        style: TextStyle(
                                          fontFamily: 'Josefin Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color.fromRGBO(112, 29, 83, 1),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
