import 'package:periscope/app_routes.dart';
import 'package:periscope/cubit/auth_cubit.dart';
import 'package:periscope/screens/forgot_screen.dart';
import 'package:periscope/screens/home_screen.dart';
import 'package:periscope/screens/login_screen.dart';
import 'package:periscope/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; //to implement bloc pattern

void main() async {
  //initialize Widgets & wait for firebase to initialize application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //material app
    return MultiProvider(
      //we want to return bloc pattern
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Login',
        theme:ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: AppRoutes.login,
        routes: <String, WidgetBuilder>{
          AppRoutes.login:(_) => const LoginScreen(),
          AppRoutes.home:(_) => const HomeScreen(),
          AppRoutes.signup:(_) => const SignupScreen(),
          AppRoutes.forgotPassword:(_) => const ForgotPassword(),
        } ,
      ),

    );
  }
}
