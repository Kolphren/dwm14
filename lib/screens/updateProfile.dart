import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Profile'), centerTitle: true,
          actions: [
            Icon(Icons.edit)
          ],
        ),
        body: SafeArea(child: Text('Update Profile')));
  }
}