import 'package:dartz/dartz.dart';
import 'package:e_wallet/core/failures/firebase_firestore_failure.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';

abstract class LedgerRepo {
  Future<Either<FirebaseFirestoreFailure, List<LedgerModel>>> fetchLedger();
}
