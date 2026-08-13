import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../response/login_response.dart';

part 'login_service.g.dart';

// const String baseUrl = "https://minafarid.mocklab.io";

const String baseUrl = "https://api.mockfly.dev/mocks/3545ab9d-e5cb-4978-bc98-6b26fdd17da2";


@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio,{String baseUrl, ParseErrorLogger? errorLogger}) = _LoginService;

  @POST("/customers/login")
  Future<HttpResponse<LoginResponse>> login(
      @Field("email") String email, @Field("password") String password);
}