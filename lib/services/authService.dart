import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<User?> _authStateChanges = _auth.authStateChanges();
  User? _user;

  bool isLoggedIn() {
    if (_user != null) return true;
    _authStateChanges.listen((User? user) {
      _user = user;
    });
    print("Logged in?");
    print(_user);
    return _user != null;
  }

  //Email/Password Sign-In
  dynamic logInEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Logging in");
      print(credential.user);
      _user = credential.user;
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Firebase exception");
      print(e.code);
      if (e.code == 'invalid-email') {
        return 'No user was found for the specified email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for user';
      }
    } catch (e) {
      print("Error!");
      print(e);
      print(e.toString());
    }
    return null;
  }

//Email/Password Register

  dynamic registerEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Enter a password at least 6 characters long';
      } else if (e.code == 'email-already-in-use') {
        return 'An account with that email already exists';
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

//Sign Out
  Future logOut() async {
    try {
      print('Logging out');
      _user = null;
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
