

import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/hotnew/model/hot.new_resp.dart';

abstract class HotAndNewServices {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}