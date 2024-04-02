import 'package:coolmovies/core/exception/default_error.dart';
import 'package:coolmovies/core/response.dart';
import 'package:coolmovies/features/rating/domain/entity/movie_details.dart';
import 'package:coolmovies/features/rating/domain/repository/movie_details_repository.dart';

abstract class MovieDetailsUseCase {
  Future<Response<DefaultError, MovieDetailsEntity>> call(String id);
}

class MovieDetailsUseCaseImp implements MovieDetailsUseCase {
  final MovieDetailsRepository repository;

  const MovieDetailsUseCaseImp({required this.repository});

  @override
  Future<Response<DefaultError, MovieDetailsEntity>> call(String id) async {
    return await repository.call(id);
  }
}
