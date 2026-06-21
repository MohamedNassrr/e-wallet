import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_wallet/core/failures/firebase_firestore_failure.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';
import 'package:e_wallet/features/home/data/repos/ledger_repo/ledger_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LedgerRepoImpl implements LedgerRepo {
  @override
  Future<Either<FirebaseFirestoreFailure, List<LedgerModel>>>
  fetchLedger() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final currentUser = FirebaseAuth.instance.currentUser!.uid;

      var result = await firestore
          .collection('ledgers')
          .where(
            Filter.or(
              Filter('from', isEqualTo: currentUser),
              Filter('to', isEqualTo: currentUser),
            ),
          )
          .orderBy('timestamp', descending: true)
          .get();

      final list = result.docs
          .map((doc) => LedgerModel.fromJson(doc.data(), doc.id))
          .toList();

      return right(list);
    } catch (e) {
      if (e is FirebaseException) {
        log('failure in ledger: ${e.toString()}');
        return left(FirebaseFirestoreFailure.fromCode(e));
      }
      log('failure in ledger: ${e.toString()}');
      return left(FirebaseFirestoreFailure(message: e.toString()));
    }
  }
}
