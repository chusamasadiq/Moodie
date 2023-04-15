import 'package:tmdb_api/tmdb_api.dart';

class APIService {
  // API Key
  final String apiKey = '652e669e27d3194e4697e41bfbf91c64';

  // Access Token
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NTJlNjY5ZTI3ZDMxOTRlNDY5N2U0MWJmYmY5MWM2NCIsInN1YiI6IjY0MmI5Yzk4YTNlNGJhMzI0OGQ4N2U2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QWVaw5MEsD6NYk50SB6u0GT-PQrQoGvNOIDnCiY9Y6g';

  Future<List<dynamic>> getTrendingMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    return trendingResult['results'];
  }
}
