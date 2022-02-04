import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: ()=> Focus.of(context).unfocus(),
        child: Scaffold(),
      ),
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
