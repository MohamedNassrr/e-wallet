import 'package:e_wallet/features/home/presentation/views/widgets/deposit_button.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transfer_button.dart';
import 'package:flutter/material.dart';

class TransactionsButtonRow extends StatelessWidget {
  const TransactionsButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 10,
      children: [TransferButton(), DepositButton()],
    );
  }
}
