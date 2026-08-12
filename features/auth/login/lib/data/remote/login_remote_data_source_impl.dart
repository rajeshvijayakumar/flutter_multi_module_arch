
import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/service/login_service.dart';
import 'package:retrofit/dio.dart';

import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginService loginService;
  final NetworkInfo networkInfo;

  LoginRemoteDataSourceImpl(this.loginService, this.networkInfo);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) async {

    return safeApiCall(networkInfo, () async {
      final response = await loginService.login(loginRequest.email, loginRequest.password);

      return response.data;
    });
  }
}