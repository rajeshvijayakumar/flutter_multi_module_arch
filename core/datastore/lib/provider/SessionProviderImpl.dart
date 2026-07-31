
import 'package:datastore/provider/SessionProvider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SessionProvider, env:[Environment.prod])
class ProdSessionProviderImpl extends SessionProvider{

  @override
  String getAccessToken() {

    return "access token from user session api";
  }

  @override
  String getClientId() {

    return "123456789";
  }

  @override
  String getRefreshToken() {

    return "refresh token from user session api";
  }

  @override
  String getUserId() {

    return "9876543210";
  }
}


@Injectable(as: SessionProvider, env:[Environment.dev])
class DevSessionProviderImpl extends SessionProvider{

  @override
  String getAccessToken() {

    return "access token from user session api";
  }

  @override
  String getClientId() {

    return "123456789";
  }

  @override
  String getRefreshToken() {

    return "refresh token from user session api";
  }

  @override
  String getUserId() {

    return "9876543210";
  }
}