import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:periscope/screens/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final List<Widget> _children = [
    const VideoScreen(),
    const Center(
      child: Text('Center 2nd of the page'),
    ),
    const Center(
      child: Text('Center 3rd of the page'),
    ),
    const Center(
      child: Text('Center 4th of the page'),
    ),
    const Center(
      child: Text('Center 5th of the page'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: _children[index]),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: index,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (ind) => setState(() => index = ind),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(EvaIcons.messageCircle),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
