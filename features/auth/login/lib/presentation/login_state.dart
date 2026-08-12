import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? userNameError;
  final String? passwordError;
  final String? errorMessage;

  const LoginState({this.userNameError, this.passwordError, this.errorMessage});

  LoginState copyWith({
    String? userNameError,
    String? passwordError,
    String? errorMessage,
  }) {
    return LoginState(
      userNameError: userNameError,
      passwordError: passwordError,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [userNameError, passwordError, errorMessage];
}

//initial state
class LoginInitial extends LoginState {}

//loading state
class LoginLoading extends LoginState {}

//success state
class LoginSuccess extends LoginState {}


//invalid input state
class LoginInValid extends LoginState {

  final String? userNameError;
  final String? passwordError;

  const LoginInValid({this.userNameError, this.passwordError})
      : super(userNameError: userNameError, passwordError: passwordError);
}

//error state
class LoginError extends LoginState {
  final String? errorMessage;

  const LoginError({this.errorMessage}) : super(errorMessage: errorMessage);
}