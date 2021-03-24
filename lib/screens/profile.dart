import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/constants/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text('Informations utilisateur'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getUserInfo(),
          builder: (context, snapshot) {

            List info = snapshot.data;

            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Email : '+ info[0].email.toString()),
                        SizedBox(height: 10),
                        Text('Nom : '+ info[0].name.toString()),
                        SizedBox(height: 10),
                        Text('Prénom : '+ info[0].firstName.toString()),
                        SizedBox(height: 10),
                        Text('Ville de résidence : '+ info[0].city.toString()),
                        SizedBox(height: 10),

                      ]
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}