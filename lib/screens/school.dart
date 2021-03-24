  
import 'package:dwm14/components/drawer.dart';
import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('School'), centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: SafeArea(child: Text('School')));
  }
}