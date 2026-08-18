

import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/domain/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
}