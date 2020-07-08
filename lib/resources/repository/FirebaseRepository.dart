import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype/resources/methods/FirebaseMethods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() async {
    return _firebaseMethods.getUser();
  }
}
