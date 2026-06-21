import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/home/presentation/controller/ledger_cubit/ledger_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/ledger_cubit/ledger_state.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/recent_transaction_list_body.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LedgerCubit, LedgerState>(
      builder: (context, state) {
        if (state is LedgerSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                  RecentTransactionListBody(
                    ledgerModel: state.ledgerModel[index],
                  ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemCount: state.ledgerModel.length,
            ),
          );
        } else if (state is LedgerEmptyState) {
          return Center(
            child: Text(
              S.of(context).noTransactionsYet,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: AppColors.grey400),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
