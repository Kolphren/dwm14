import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: (){
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Déconnexion', 
              style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await firebaseAuth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      )),
    );
  }
}
