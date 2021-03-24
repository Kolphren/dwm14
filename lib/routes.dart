import 'package:dwm14/screens/home.dart';
import 'package:dwm14/screens/profile.dart';
import 'package:dwm14/screens/detail.dart';
import 'package:dwm14/screens/school.dart';
import 'package:dwm14/screens/login.dart';
import 'package:dwm14/screens/updateDetail.dart';
import 'package:dwm14/screens/updateProfile.dart';
import 'package:dwm14/screens/register.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => HomeScreen(),
  '/detail': (contaxt) => DetailScreen(),
  '/profile': (context) => ProfileScreen(),
  '/school': (context) => SchoolScreen(),
  '/updateDetail': (context) => UpdateDetailScreen(),
  '/updateProfile': (context) => UpdateProfileScreen(),
  '/register': (context) => RegisterScreen(),
  '/login': (context) => LoginScreen(),
};