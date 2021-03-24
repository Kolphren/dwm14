import 'package:dwm14/constants/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorValidation = '';

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Login'),
              SizedBox(height: 40),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      } else if (value.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.-]+@[a-zA-Z0-9]+\.[a-z]+$").hasMatch(value)) {
                        return 'Invalid email';
                      }
                        return null;
                    },
/*                     onChanged: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                    }, */
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Entrez votre email',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      } else if (value.length < 8) {
                        return 'Mot de passe trop court';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Entrez votre mot de passe',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(errorValidation),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        try {
                            await firebaseAuth.signInWithEmailAndPassword(
                              email: email, password: password);
                              print(isLogged());
                              Navigator.pushReplacementNamed(context, '/home');
                            } on FirebaseAuthException catch (error) {
                            if (error.code == 'user-not-found') {
                              setState(() {
                                errorValidation = 'Email ou mot de passe invalide';
                              });
                            } else if (error.code == 'wrong-password') {
                              setState(() {
                                errorValidation = 'Email ou mot de passe invalide';
                              });
                            }
                        } catch (error) {
                          print(error);
                        }
                      }
                    },
                    child: Text('Connexion'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                      
                  child: Text("Créer un compte"),
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      )    
    );
  }
}