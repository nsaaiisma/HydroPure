import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// REGISTER
  Future<UserCredential> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      // username: username,
      email: email,
      password: password,
    );
  }

  /// LOGIN
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('error login: $e');
      return Future.error(e);
    }
  }

  // Inisialisasi di level variabel class
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '90627798394-15i78ppj6im69asqf34vbh8f483goapn.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Panggil signIn langsung
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) throw Exception("Login dibatalkan");

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Error detail: $e");
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  /// LOGOUT
  Future<void> logout() async {
    try {
      // Sign out dari Google (Penting untuk Web agar sesi tidak tersangkut)
      await GoogleSignIn().signOut();
      // Sign out dari Firebase
      await _auth.signOut();
    } catch (e) {
      throw Exception("Gagal logout: $e");
    }
  }
}
