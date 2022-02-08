import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periscope/app_routes.dart';
import 'package:periscope/bloc/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/logo.png'),
                    height: 180,
                    width: 180,
                  ),
                ]),
          )),
        ),
      );
    }, listener: (BuildContext context, AuthState state) {
      if (state is UserLoggedInSuccess) {
        Navigator.of(context).pushNamed(AppRoutes.home);
      } else if (state is UserLoggedInFailure) {
        Navigator.of(context).pushNamed(AppRoutes.login);
      }
    });
  }
}
