import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';

abstract class SerchServices {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
