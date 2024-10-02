import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';

class AuthService {
  static AuthService? _instance;

  AuthService._internal() {
    _instance = this;
  }

  factory AuthService() => _instance ?? AuthService._internal();

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      LogUtility.writeLog('Auth Error : $e');
      rethrow;
    } on FirebaseException catch (e) {
      LogUtility.writeLog("Firebase Error : $e");
      rethrow;
    } catch (e) {
      LogUtility.writeLog("System Error : $e");
      rethrow;
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
