import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionListBody extends StatelessWidget {
  const RecentTransactionListBody({super.key, required this.ledgerModel});

  final LedgerModel ledgerModel;
  @override
  Widget build(BuildContext context) {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
  final isOutgoing =
    ledgerModel.transactionType == TransactionType.transfer &&
    ledgerModel.from == currentUid;
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(8)),
        color: Colors.transparent.withValues(alpha: 0.05),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Text(
                  ledgerModel.receiverPhone ?? S.of(context).Received,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${ledgerModel.timestamp}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: AppColors.grey400),
                ),
              ],
            ),
            Text(
              'EGP ${ledgerModel.amount}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isOutgoing ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
