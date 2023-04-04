/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodie/screens/login/login.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);

    if (user == null) {
      return const Login();
    } else {
      return const Home();
    }
  }
}
 */

import 'package:flutter/material.dart';
import 'package:moodie/screens/authentication/login.dart';
import 'package:moodie/screens/authentication/register.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? Login(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
