import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/infrastructure/firebase_auth/firebase_auth_client.dart';
import 'package:great_talk/repository/result.dart';

class FirebaseAuthRepository {
  final client = FirebaseAuthClient();

  FutureResult<User> signInAnonymously() async {
    late Result<User> result;
    try {
      final res = await client.signInAnonymously();
      if (res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res.user!);
    } catch (e) {
      debugPrint(e.toString());
      result = const Result.failure();
    }
    return result;
  }

  FutureResult<User> signInWithApple() async {
    late Result<User> result;
    try {
      final res = await client.signinWithApple();
      if (res == null || res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res!.user!);
    } catch (e) {
      debugPrint(e.toString());
      result = const Result.failure();
    }
    return result;
  }

  FutureResult<User> signInWithGoogle() async {
    late Result<User> result;
    try {
      final res = await client.signInWithGoogle();
      if (res == null || res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res!.user!);
    } catch (e) {
      debugPrint(e.toString());
      result = const Result.failure();
      FirebaseFirestore.instance.collection('googleSigninErrors').doc().set({
        "error": e.toString(),
      });
    }
    return result;
  }

  FutureResult<bool> signOut() async {
    try {
      await client.signOut();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> reauthenticateWithCredential(
      User user, AuthCredential credential) async {
    try {
      await client.reauthenticateWithCredential(user, credential);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteUser(User user) async {
    try {
      await client.deleteUser(user);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
