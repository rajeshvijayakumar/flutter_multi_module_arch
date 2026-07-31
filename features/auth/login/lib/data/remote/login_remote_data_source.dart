import 'dart:io';
import 'package:retrofit/dio.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest);
}