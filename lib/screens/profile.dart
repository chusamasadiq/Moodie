import 'package:flutter/material.dart';

import '../services/authService.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 70,
            leading: IconButton(
              color: const Color(0xffCEB846),
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'John Arbuckle',
              style: TextStyle(
                fontFamily: 'Josefin Sans',
                fontSize: 40.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 40.0,
                  color: Colors.white,
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 115.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff6F1C54),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Josefin Sans',
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: const Text(
                    'Change username',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                  ),
                  title: const Text(
                    'Change email',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.key,
                  ),
                  title: const Text(
                    'Change password',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(color: Colors.black),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: const Text(
                    'Log out',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () async {
                    print('Tapped logout');
                    await _auth.logOut();
                    if (context.mounted) {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    }
                  },
                ),
              ],
            ),
          ),
          body: Stack(alignment: AlignmentDirectional.topCenter, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 130.0, 30.0, 0.0),
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xff6F1C54),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding:
                                  EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
                              child: Text(
                                'Your comments',
                                style: TextStyle(
                                  fontFamily: 'Josefin Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                            )),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            alignment: const Alignment(0, 1.15),
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/mazeRunner.jpeg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromRGBO(207, 185, 66, 1),
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'The Maze Runner',
                                  style: TextStyle(
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            alignment: const Alignment(0, 1.15),
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/mazeRunner.jpeg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromRGBO(207, 185, 66, 1),
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'The Maze Runner',
                                  style: TextStyle(
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            alignment: const Alignment(0, 1.15),
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/mazeRunner.jpeg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromRGBO(207, 185, 66, 1),
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  'The Maze Runner',
                                  style: TextStyle(
                                    fontFamily: 'Josefin Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff6F1C54), width: 15.0),
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5.0),
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage('./assets/images/avatar.png'),
                ),
              ),
            )
          ]),
        ));
  }
}
