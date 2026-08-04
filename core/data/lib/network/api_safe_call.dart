
import 'package:dartz/dartz.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/model/localized_message.dart';

Future<Either<Failure, T>> safeApiCall<T>(NetworkInfo networkInfo, Future<T> Function() apiCall) async {

  if(await networkInfo.isConnected) {
    try {
      final response = await apiCall();
      return Right(response);
    } catch (error) {
      return Left(
          Failure(0,  "") //todo error handler here
      );
    }
  } else {
    return Left(
        Failure(
            -500,
            "network connectivity issue, please check") //todo error handler here
    );
  }
}