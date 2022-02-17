import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:periscope/models/bottom_bar.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum BottomIcons { Home, Favorite, share, smiles, Account }

class _HomeScreenState extends State<HomeScreen> {
  BottomIcons bottomIcons = BottomIcons.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          bottomIcons == BottomIcons.Home
              ? const Center(
                  child: Text(
                    "this is home page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Favorite
              ? const Center(
                  child: Text(
                    "Hi, this is favorite page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.smiles
              ? const Center(
                  child: Text(
              "Send smiles",
              style: TextStyle(fontSize: 18),
               ),
               )
              : Container(),
          bottomIcons == BottomIcons.share
              ? const Center(
                  child: Text(
                    "share",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Account
              ? const Center(
                  child: Text(
                    "account page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                      icons: EvaIcons.messageCircle,
                      text: "chat"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Favorite;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Favorite ? true : false,
                      icons: EvaIcons.heartOutline,
                      text: "Sent Love"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.smiles;
                        });
                      },
                      bottomIcons:
                      bottomIcons == BottomIcons.smiles ? true : false,
                      icons: EvaIcons.smilingFace,
                      text: "Sent smiles"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.share;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.share ? true : false,
                      icons: EvaIcons.share,
                      text: "share"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Account;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                      icons: EvaIcons.personOutline,
                      text: "Account"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
