import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/core/failures/firebase_firestore_failure.dart';
import 'package:e_wallet/features/home/data/models/wallet_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createWallet() async {
    try {
      WalletModel walletModel = WalletModel(
        userId: _auth.currentUser!.uid,
        balance: 0,
        createdAt: FieldValue.serverTimestamp(),
        currency: "EGP",
      );
      await _firestore
          .collection('wallets')
          .doc(_auth.currentUser!.uid)
          .set(walletModel.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseFirestoreFailure.fromCode(e);
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Stream<WalletModel> getWalletStream()  {
    return  FirebaseFirestore.instance
        .collection('wallets')
        .doc(_auth.currentUser!.uid)
        .snapshots()
        .map((doc) => WalletModel.fromJson(doc.data()!));
  }
}
