
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:periscope/cubit/auth_cubit.dart';
import 'package:periscope/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: ()=> Focus.of(context).unfocus(),
        child: Scaffold(
          body: BlocConsumer<AuthCubit, AuthState>(
            listener:(context, state){
              if(state is AuthLoginError){
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text(state.errorMessage!),
                ));
              if(state is AuthLoginSuccess){
                formkey.currentState!.reset();
                  Navigator.push(
                      context, MaterialPageRoute(builder:(_) => const HomeScreen())
                  );
                }
              }
            },
            builder: (context, state) => _buildLoginScreen(),
          ),
        ),
      ),
    );
  }
  Widget _buildLoginScreen(){
    return SafeArea(
      child: FormBuilder(
      key: formkey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Center(
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Image(image: AssetImage('assets/logo.png'),
                height: 180,
                  width: 180,
                ),
              ]),
          )
        ),
      )
    );

  }

  Future<bool> _onWillPop() async{
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Exit Application"),
          content: const Text("Are you sure?"),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                SystemNavigator.pop();
              },
              child: const Text("yes", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("yes", style: TextStyle(color: Colors.black54)),
            ),

          ],

        )

      )) ?? false;
    }
  }
