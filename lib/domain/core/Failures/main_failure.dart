import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';
@freezed
class MainFailure with _$MainFailure{
  //! clientFailure
  const factory MainFailure.clientFailure() = _ClientFailure;
  //! serverFailure
  const factory MainFailure.serverFailure() = _ServerFailure;
  
}