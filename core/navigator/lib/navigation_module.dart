
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:main/main_bloc.dart';
import 'package:navigator/navigation_bloc.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:flutter_multi_module_arch/di/injection.dart';
import 'package:navigator/navigation_routes.dart';
import 'package:main/main_screen.dart';
import 'package:navigator/navigation_state.dart';
import 'package:navigator/navigation_types.dart';

class NavigationModule extends StatelessWidget{

  const NavigationModule({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          // provides navigation bloc
          BlocProvider(create: (_) => NavigationBloc()),
          // provides login bloc
          BlocProvider(create: (_) => LoginBloc(getIt<LoginUseCase>())),
          //provides home bloc
          // BlocProvider(create: (_) => HomeBloc()), // provide home screen bloc
          //provides main bloc
          BlocProvider(create: (_) => MainScreenBloc()), // provide main screen bloc
        ],

        child: MaterialApp(
          routes: {
            NavigationRoutes.main: (context) => MainScreen(),
            NavigationRoutes.login: (context) => LoginScreen(),

          },
          home: BlocListener<NavigationBloc, NavigationState>(
            listener: (context, state){
              if(state.route.isNotEmpty){
                switch(state.navigationType){
                case NavigationType.replace:
                  Navigator.of(context).pushReplacementNamed(state.route);
                  break;
                case NavigationType.push:
                  Navigator.of(context).pushNamed(state.route);
                  break;
                case NavigationType.pop:
                  Navigator.of(context, rootNavigator: true).pop(true);
                  break;
                }
              }
            },
            child: MainScreen() // initial default screen
          ),
        )
    );
  }

}