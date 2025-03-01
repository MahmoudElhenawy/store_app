import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔹 تسجيل الدخول باستخدام Gmail
  Future<bool> signInWithGmail(String email, String password) async {
    try {
      if (!email.endsWith("@gmail.com")) {
        throw FirebaseAuthException(
            code: "invalid-email", message: "Only Gmail accounts are allowed.");
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // if (!userCredential.user!.emailVerified) {
      //   throw FirebaseAuthException(
      //       code: "email-not-verified",
      //       message: "Please verify your email first.");
      // }

      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // 🔹 تسجيل حساب جديد باستخدام Gmail
  Future<bool> signUpWithGmail(
      String email, String password, String fullName, String phone) async {
    try {
      if (!email.endsWith("@gmail.com")) {
        throw FirebaseAuthException(
            code: "invalid-email", message: "Only Gmail accounts are allowed.");
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.sendEmailVerification();

      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // 🔹 تسجيل خروج
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
