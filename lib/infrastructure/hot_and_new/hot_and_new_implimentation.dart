import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/hotnew/hot_and_new_services.dart';
import 'package:netflix/domain/hotnew/model/hot.new_resp.dart';

@LazySingleton(as: HotAndNewServices)
class HotAndNewImplementation implements HotAndNewServices {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    // TODO: implement getHotAndNewMovieData
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      ); //-> Url (Apicall)
      //log(response.data.toString());
      //checking statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure
            .serverFailure()); //Left -> MainFailure (sever / client )
      }
    } catch (e) {
      log(e.toString());
      return const Left(
          MainFailure.clientFailure()); //Internet failure or any ....
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    // TODO: implement getHotAndNewTvData
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      ); //-> Url (Apicall)
      //log(response.data.toString());
      //checking statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure
            .serverFailure()); //Left -> MainFailure (sever / client )
      }
    } catch (e) {
      log(e.toString());
      return const Left(
          MainFailure.clientFailure()); //Internet failure or any ....
    }
  }
}
