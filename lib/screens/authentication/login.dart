import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodie/services/authService.dart';

/*
class Login extends StatefulWidget {
  final Function toggleView;

  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => password = val);
            },
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {},
            child: const Text('Sign In'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              widget.toggleView();
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}*/

class Login extends StatefulWidget {
  final Function toggleView;

  const Login({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  //TextEditingController userNameController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff6F1C54),
        Color(0xff6F1C54),
        Color(0xff4A1D3A),
        Color(0xff281E26),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                color: const Color(0xffCEB846),
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff6F1C54),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontFamily: 'Josefin Sans',
                                  fontSize: 32,
                                  color: Color(0xffCEB846),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              'email:',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() => email = val);
                                setState(() {
                                  error = '';
                                });
                              },
                              //controller: userNameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xff6F1C54),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E3E3)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              'password:',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() => password = val);
                                setState(() {
                                  error = '';
                                });
                              },
                              obscureText: true,
                              //controller: userNameController,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xff6F1C54),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E3E3)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  error,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xffCEB846),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffCEB846),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.shortcut),
                                color: Colors.white,
                                onPressed: () async {
                                  if (email.isEmpty || password.isEmpty) {
                                    setState(() {
                                      error = 'All the fields must be filled';
                                    });
                                  } else {
                                    setState(() {
                                      error = '';
                                    });
                                  }
                                  if (error.isEmpty) {
                                    dynamic result = await _auth
                                        .logInEmailPassword(email, password);

                                    result ??=
                                        'An error occurred. Please try again';
                                    if (result is String) {
                                      setState(() {
                                        error = result;
                                      });
                                    } else if (result is User) {
                                      print("Login successful");
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                      }
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff6F1C54),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Josefin Sans',
                    ),
                  ),
                ),
                Text(
                  'Moodie',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2, 1),
                          blurRadius: 15),
                    ],
                    fontSize: 50,
                    color: const Color(0xffCEB846),
                    fontFamily: 'Leckerli One',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
