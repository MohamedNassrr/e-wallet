import 'package:e_wallet/features/home/presentation/views/widgets/history_view_body.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).transaction,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const HistoryViewBody(),
    );
  }
}
