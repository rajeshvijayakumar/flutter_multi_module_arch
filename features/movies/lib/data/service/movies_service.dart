import 'package:dio/dio.dart';
import 'package:movies/data/response/movies_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movies_service.g.dart';

const String baseUrl = "https://api.mockfly.dev/mocks/82cfcee5-dc8a-4ccf-bd0e-be0526ad8035";

@RestApi(baseUrl: baseUrl)
abstract class MoviesService {

  factory MoviesService(Dio dio,
  {String baseUrl, ParseErrorLogger errorLogger }) = _MoviesService;

  @GET('/entertainment/movies')
  Future<HttpResponse<MoviesResponse>> getMovies();

}