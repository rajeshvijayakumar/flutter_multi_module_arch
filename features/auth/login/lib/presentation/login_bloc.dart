

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()){

    //handle username changed event
    on<UserNameChanged>((event, emit){
        //TODO logic here
    });

    //handle password changed event
    on<PasswordChanged>((event, emit){
      //TODO logic here
    });

    //handle login button press event
    on<LoginButtonPressed>((event, emit){
      //TODO logic here
    });
  }
}