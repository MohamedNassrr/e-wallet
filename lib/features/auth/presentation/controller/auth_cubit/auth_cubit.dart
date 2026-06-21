import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/core/failures/firebase_auth_failure.dart';
import 'package:e_wallet/features/auth/data/models/user_model.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialStates());

  final _auth = FirebaseAuth.instance;
  String verificationId = '';

  void phoneAuth({required String phoneNumber}) {
    emit(AuthLoadingStates());
    _auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationField,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    emit(AuthVerifiedStates());
    await _auth.signInWithCredential(phoneAuthCredential);
  }

  void verificationField(FirebaseAuthException e) {
    log("ERROR CODE: ${e.code}");
    log("ERROR MESSAGE: ${e.message}");

    final failure = FirebaseAuthFailure.fromCode(e.code);
    emit(AuthFailureStates(failure: failure.message));
  }

  void codeSent(dynamic verificationId, resendToken) async {
    log('code sent');
    this.verificationId = verificationId;
    emit(AuthCodeSubmittedStates());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitOtp(String otpCode) async {
    emit(AuthLoadingStates());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    try {
      await _auth.signInWithCredential(credential);
      await handlerPostLogin();
      emit(AuthSuccessStates());
    } on FirebaseAuthException catch (e) {
      final failure = FirebaseAuthFailure.fromCode(e.code);
      emit(AuthFailureStates(failure: failure.message));
      log(failure.message.toString());
    } catch (e) {
      log("Error signing in with phone auth: ${e.toString()}");
    }
  }

  Future<void> handlerPostLogin() async {
    final user = _auth.currentUser;

    if (user == null) return;

    final userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid);

    final userModel = UserModel(
      phoneNumber: user.phoneNumber,
      uId: user.uid,
      createdAt: FieldValue.serverTimestamp(),
    );

    if (!(await userRef.get()).exists) {
      await userRef.set(userModel.toMap(), SetOptions(merge: true));
    }
  }
}
