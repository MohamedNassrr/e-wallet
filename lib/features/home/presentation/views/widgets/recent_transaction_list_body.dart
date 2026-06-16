import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionListBody extends StatelessWidget {
  const RecentTransactionListBody({super.key, required this.ledgerModel});

  final LedgerModel ledgerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: const BoxDecoration(
        borderRadius: .all(.circular(8)),
        color: Colors.white,
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
                  ledgerModel.receiverPhone ?? 'ME',
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
                color: ledgerModel.transactionType == TransactionType.transfer
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
