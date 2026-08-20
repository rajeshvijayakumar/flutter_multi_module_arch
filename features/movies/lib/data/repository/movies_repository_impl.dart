import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/data/source/cache/movies_local_data_source.dart';
import 'package:movies/data/source/remote/movies_remote_data_source.dart';
import 'package:movies/domain/mapper/movie_mapper.dart';
import 'package:movies/domain/model/movie.dart';
import 'package:movies/domain/repository/movies_repository.dart';

import '../../domain/mapper/cache_mapper.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesRepositoryImpl(this.moviesRemoteDataSource, this.moviesLocalDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    if (await moviesLocalDataSource.hasValidCache()) {
      // fetch from the cache
      final cachedMovies = await moviesLocalDataSource.getMovies();

      return Right(
        cachedMovies.map((cachedMovie) => cachedMovie.toMovie()).toList(),
      );
    } else {
      // fetch from server
      final result = await moviesRemoteDataSource.getMovies();

      return result.fold((failure) => Left(failure), (response) async {
        await moviesLocalDataSource.cacheMovies(
          response.movies!
              .map((movieResponse) => movieResponse.toDomain().toCachedMovie())
              .toList(),
        );
        return Right(response.toDomain());
      });
    }
  }
}
