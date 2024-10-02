import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        UserCredential result = await auth.signInWithCredential(authCredential);

        // User? user = result.user;

        if (result != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("login successful")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failed to login"),
            ),
          );
        }
      }
    } catch (e) {
      log("message: $e.message");
    }
  }

  Future<void> signout(BuildContext context) async {
    try {
      await auth.signOut();
      final logs = await GoogleSignIn().signOut();
      if (logs == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Logout successful"),
          ),
        );
      }
      log("message: Sign out successful. User: $auth.currentUser");
    } catch (e) {
      "message : ${e.toString()}";
    }
  }
}
