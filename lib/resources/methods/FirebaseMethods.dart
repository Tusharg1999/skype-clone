import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }
}
