import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/components/landing.dart';
import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/screens/detail.dart';
import 'package:flutter/material.dart';

import '../components/square.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  int nb = 0;
  Color color = Colors.blue;
  bool disable = false;

  _onTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Widget> list = [
    Landing(),
    Container(),
    Text('School')
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter'), centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: SafeArea(
          child: list[_selectedPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: Colors.red[800],
          onTap: (index) {
            _onTap(index);
          },
        ));
  }
}




class RowCube extends StatelessWidget {
  const RowCube({
    Key key,
    this.firstCubeColor,
    this.secondCubeColor,
  }) : super(key: key);

  final firstCubeColor;
  final secondCubeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(
          color: firstCubeColor,
        ),
        SizedBox(
          width: 10,
        ),
        Square(color: secondCubeColor),
      ],
    );
  }
}