import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/authService.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String username = '';
  String password = '';
  String confirmPassword = '';
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff6F1C54),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'SIGN UP',
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
                                errorStyle: const TextStyle(height: 0.01),
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
                                errorBorder: OutlineInputBorder(
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
                              'username:',
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
                                setState(() => username = val);
                                setState(() {
                                  error = '';
                                });
                              },
                              //controller: userNameController,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(height: 0),
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
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
                                errorBorder: OutlineInputBorder(
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
                                errorStyle: const TextStyle(height: 0),
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
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
                                errorBorder: OutlineInputBorder(
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
                              'confirm password:',
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
                                setState(() => confirmPassword = val);
                                setState(() {
                                  error = '';
                                });
                              },
                              obscureText: true,
                              //controller: userNameController,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(height: 0),
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
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
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E3E3)),
                                ),
                              ),
                            ),
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
                                    if (email.isEmpty ||
                                        username.isEmpty ||
                                        password.isEmpty ||
                                        confirmPassword.isEmpty) {
                                      setState(() {
                                        error = 'All the fields must be filled';
                                      });
                                    } else if (password != confirmPassword) {
                                      setState(() {
                                        error = 'Passwords don\'t match';
                                      });
                                    } else {
                                      setState(() {
                                        error = '';
                                      });
                                    }
                                    if (error.isEmpty) {
                                      dynamic result =
                                          await _auth.registerEmailPassword(
                                              email, password);

                                      result ??=
                                          'An error occurred. Please try again';
                                      if (result is String) {
                                        setState(() {
                                          error = result;
                                        });
                                      } else if (result is User) {
                                        if (context.mounted) {
                                          Navigator.pop(context);
                                        }
                                      }
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  'Already have an account?',
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
                  onPressed: () async {
                    widget.toggleView();
                  },
                  child: const Text(
                    'LOGIN',
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
