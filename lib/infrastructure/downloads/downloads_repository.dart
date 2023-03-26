//!BackEnd
import 'package:dio/dio.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';


class DownloadsRepository implements IDownloadsRepo{
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages() async{
    //! API CALL
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.downloads); //-> Url (Apicall)
      //checking statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadList = [];
        for(final raw in response.data) {
          downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailure.serverFailure()); //Left -> MainFailure (sever / client )
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure()); //Internet failure or any ....
    }
  }
   
}