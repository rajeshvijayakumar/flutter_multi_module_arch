

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()){

    //handle username changed event
    on<UserNameChanged>((event, emit){
      final usernameError = validateUserName(event.userName);

      emit(LoginInValid(userNameError: usernameError,
      passwordError: (state is LoginInValid) ? state.passwordError : null));

    });

    //handle password changed event
    on<PasswordChanged>((event, emit){
      final passwordError = validateUserName(event.password);

      emit(LoginInValid(passwordError: passwordError,
          userNameError: (state is LoginInValid) ? state.userNameError : null));

    });

    //handle login button press event
    on<LoginButtonPressed>((event, emit){
      //TODO logic here
    });
  }

  String? validateUserName(String userName) {
    if (userName.isEmpty) {
      return "Username cannot be empty";
    } else if (userName.length < 3) {
      return "Username must be at least 3 chars";
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "password cannot be empty";
    } else if (password.length < 6) {
      return "password must be at least 6 chars";
    }

    return null;
  }
}