// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class AuthenticationService with ChangeNotifier {
//   final FirebaseAuth _firebaseAuth;
//
//   AuthenticationService(this._firebaseAuth);
//
//
//   Future<bool> signIn({required String email, required String password}) async {
//     try{
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       debugPrint(e.message ?? "Unknown Error");
//       return false;
//     }
//   }
//
//   Future<bool>signUp( String email,  String password) async {
//     try{
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       debugPrint(e.message ?? "Unknown Error");
//       return false;
//     }
//   }
//
// }