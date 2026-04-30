import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreFailure {
  final String message;

  FirebaseFirestoreFailure({required this.message});

  factory FirebaseFirestoreFailure.fromCode(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFirestoreFailure(
          message: 'You do not have permission to perform this action.',
        );

      case 'unavailable':
        return FirebaseFirestoreFailure(
          message: 'Firestore service is currently unavailable.',
        );

      case 'not-found':
        return FirebaseFirestoreFailure(
          message: 'The requested document was not found.',
        );

      case 'already-exists':
        return FirebaseFirestoreFailure(
          message: 'The document already exists.',
        );

      case 'resource-exhausted':
        return FirebaseFirestoreFailure(
          message: 'Resource limit exceeded. Try again later.',
        );

      case 'failed-precondition':
        return FirebaseFirestoreFailure(
          message: 'Operation failed due to a system condition.',
        );

      case 'aborted':
        return FirebaseFirestoreFailure(
          message: 'The operation was aborted. Please try again.',
        );

      case 'deadline-exceeded':
        return FirebaseFirestoreFailure(
          message: 'The operation timed out.',
        );

      case 'cancelled':
        return FirebaseFirestoreFailure(
          message: 'The operation was cancelled.',
        );

      case 'data-loss':
        return FirebaseFirestoreFailure(
          message: 'Data loss occurred.',
        );

      case 'invalid-argument':
        return FirebaseFirestoreFailure(
          message: 'Invalid data was provided.',
        );

      default:
        return FirebaseFirestoreFailure(
          message: e.message ?? 'An unknown Firestore error occurred.',
        );
    }
  }
}