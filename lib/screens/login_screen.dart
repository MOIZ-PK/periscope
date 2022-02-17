import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periscope/bloc/auth_bloc.dart';
import 'package:periscope/constant.dart';
import 'package:periscope/widgets/custom_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormBuilderState>();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
        child: Scaffold(
          body: _buildLoginScreen(),
        ),
      ),
    );
  }

  Widget _buildLoginScreen() {
    return SafeArea(
        child: FormBuilder(
          key: formkey,
          autovalidateMode: AutovalidateMode.disabled,
        child: Center(
          child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Image(
            image: AssetImage('assets/logo.png'),
            height: 150,
            width: 180,
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: FormBuilderTextField(
                textInputAction: TextInputAction.next,
                name: "Email",
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Enter Email",
                  hintStyle: kMinStyle,
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: kOutLineBorder,
                  focusedBorder: kOutLineBorder,
                  errorBorder: kOutlineErrorBorder,
                  focusedErrorBorder: kOutlineErrorBorder,
                )
            ),
          ),
            const SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FormBuilderTextField(
                  textInputAction: TextInputAction.next,
                  name: "Password",
                  obscureText: !_passwordVisible,
                  decoration:InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Enter your Password",
                    hintStyle: kMinStyle,
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: kOutLineBorder,
                    focusedBorder: kOutLineBorder,
                    errorBorder: kOutlineErrorBorder,
                    focusedErrorBorder: kOutlineErrorBorder,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
              ),
            ),
          ]),
        )),
    ));
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Exit Application"),
                  content: const Text("Are you sure?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text("Yes",
                          style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("No",
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ))) ??
        false;
  }
}

//Custom Button for Login

// class LoginButton extends StatelessWidget {
//   final Function onPressed;
//   const LoginButton({Key? key, required this.onPressed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>();
//   },
// }
