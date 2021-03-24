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
                        SizedBox(height: 80),
                        Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        Text(info[0].email.toString(), style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10),
                        Text('Nom', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        Text(info[0].name.toString(), style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10),
                        Text('Prénom', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        Text(info[0].firstName.toString(), style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10),
                        Text('Ville de résidence', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        Text(info[0].city.toString(), style: TextStyle(fontSize: 20),),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () async {
                            await firebaseAuth.signOut();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text('Déconnexion'),
                          )
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