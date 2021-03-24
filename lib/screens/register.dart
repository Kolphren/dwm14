import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dwm14/constants/firebase.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String name = '';
  String firstName = '';
  String city = '';
  String password = '';
  String error = '';
  String errorValidation = '';
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [Text('Register'),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                        return null;
                    },
/*                     onChanged: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                    }, */
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Entrez votre nom',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                        return null;
                    },
/*                     onChanged: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                    }, */
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      hintText: 'Entrez votre prénom',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        city = value;
                      });
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                        return null;
                    },
/*                     onChanged: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                    }, */
                    decoration: InputDecoration(
                      labelText: 'Ville',
                      hintText: 'Entrez votre ville',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      } else if (value.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.-]+@[a-zA-Z0-9-]+\.[a-z]+$").hasMatch(value)) {
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
/*                     onChanged: (value) {
                      if(value.isEmpty) {
                        return 'Vide';
                      }
                    }, */
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
                        Navigator.pushNamed(context, '/home');
                        try {
                          UserCredential userCredential = 
                            await firebaseAuth.createUserWithEmailAndPassword(
                              email: email, password: password);
                          if (userCredential.user != null) {
                            final docReference = 
                            firestore.collection('users');
                            docReference.add({
                              'name' : name,
                              'firstName' : firstName,
                              'city' : city, 
                              'email' : userCredential.user.email
                            }).catchError((error) {
                              setState(() {
                                errorValidation = 'Failed to add an user';
                              });
                            });
                          }
                        } on FirebaseAuthException catch (error) {
                            if (error.code == 'weak-password') {
                              setState(() {
                                errorValidation = 'Mot de passe trop faible';
                              });
                            } else if (error.code == 'email-already-in-use') {
                              setState(() {
                                errorValidation = 'Email déjà utilisé';
                              });
                            }
                        }catch (error) {
                          print(error);
                        }
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            )
            ],
          ))),
    );
  }
}