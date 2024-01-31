import 'package:movie_app/feature/featue_api/data/data_Source/api_services_datasource.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/api_services_datasource_impl.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_repository_impl.g.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiServcesDatasource datasource;
  ApiRepositoryImpl({required this.datasource});
  @override
  Future<List<MovieEntity>?> getMovies() async {
    final data = await datasource.getMovie();

    late List<MovieEntity> result;
    result = [
      for (final result in data!)
        MovieEntity(
          id: result.id,
          title: result.title,
          overview: result.overview,
          releaseDate: result.releaseDate,
          posterPath: result.posterPath,
          voteAverage: result.voteAverage,
          originalLanguage: result.originalLanguage,
          backdropPath: result.backdropPath,
        ),
    ];
    return result;
  }

  Future<List<MovieEntity>?> getMoviesTopRated() async {
    final data = await datasource.getMovieTopRated();

    late List<MovieEntity> result;
    result = [
      for (final result in data!)
        MovieEntity(
          id: result.id,
          title: result.title,
          overview: result.overview,
          releaseDate: result.releaseDate,
          posterPath: result.posterPath,
          voteAverage: result.voteAverage,
          originalLanguage: result.originalLanguage,
          backdropPath: result.backdropPath,
        ),
    ];
    return result;
  }

  Future<List<MovieEntity>?> getMoviesPopular() async {
    final data = await datasource.getMoviePopular();

    late List<MovieEntity> result;
    result = [
      for (final result in data!)
        MovieEntity(
          id: result.id,
          title: result.title,
          overview: result.overview,
          releaseDate: result.releaseDate,
          posterPath: result.posterPath,
          voteAverage: result.voteAverage,
          originalLanguage: result.originalLanguage,
          backdropPath: result.backdropPath,
        ),
    ];
    return result;
  }

  Future<List<MovieEntity>?> getMoviesUpcoming() async {
    final data = await datasource.getMovieUpcoming();

    late List<MovieEntity> result;
    result = [
      for (final result in data!)
        MovieEntity(
          id: result.id,
          title: result.title,
          overview: result.overview,
          releaseDate: result.releaseDate,
          posterPath: result.posterPath,
          voteAverage: result.voteAverage,
          originalLanguage: result.originalLanguage,
          backdropPath: result.backdropPath,
        ),
    ];
    return result;
  }
}

@riverpod
ApiRepository apiRepository(ApiRepositoryRef ref) {
  return ApiRepositoryImpl(datasource: ref.watch(apiServcesDatasourceProvider));
}
