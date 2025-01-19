import 'package:dio/dio.dart';

// final Dio _dio = Dio(BaseOptions(baseUrl: ));

class DioConn {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl:
          'https://api.themoviedb.org/'));

  static Dio get dio {
    _setupInterceptors();
    return _dio;
  }

  static void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const accessToken =
            "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2YyMzQ3NTU1YjBiMzc5NWY2OTQxYWQxNTUyMDhlZCIsIm5iZiI6MTczNjUwOTAyNS4zNTIsInN1YiI6IjY3ODEwNjYxMTI2Njc5Njg4NTRlYzgyMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NZtUyccm0KUnMPEZKZxeSfMCTrOo9yLaEcX1WzRpDJA";

        options.headers['Authorization'] ="Bearer $accessToken";
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ));
  }
}
