import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_module_arch/di/injection.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

class LoginScreen extends StatelessWidget {

  final LoginUseCase loginUseCase = getIt<LoginUseCase>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
          create: (context) => LoginBloc(loginUseCase),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username input field
                  TextField(
                    controller: userNameController,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(UserNameChanged(value));
                    },
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: state is LoginInValid ? state.userNameError : null
                    ),
                  ),

                  // Password input field
                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordChanged(value));
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: state is LoginInValid ? state.passwordError : null
                    ),
                  ),
                  const SizedBox(height: 20),

                  //login button
                  ElevatedButton(
                      onPressed: (){
                        final userName = userNameController.text;
                        final password = passwordController.text;
                        context
                            .read<LoginBloc>()
                            .add(LoginButtonPressed(userName, password));
                      },
                      child: Text("Login"))
                ],
              ),
            );
          }),
      ),
    );
  }
}
