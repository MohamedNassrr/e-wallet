import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/features/home/presentation/controller/ledger_cubit/ledger_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/ledger_cubit/ledger_state.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_state.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/bank_card.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/recent_transaction_list_body.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transactions_button_row.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          context.read<WalletCubit>().fetchWallet(isRefresh: true),
          context.read<LedgerCubit>().fetchLedger(isRefresh: true),
        ]);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocConsumer<WalletCubit, WalletStates>(
          listener: (context, state) {
            if (state is FetchWalletFailureStates) {
              SnackBar snackBar = SnackBar(
                content: Text(state.errMessage.toString()),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is FetchWalletSuccessStates) {
              var walletCubit = state.walletModel;
              return Padding(
                padding: const EdgeInsets.only(left: 27, right: 27, top: 27),
                child: Column(
                  crossAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    BankCard(
                      cardholderName: 'Mohamed Nasr',
                      brandName: 'VISA',
                      cardNumber: '**** 4242',
                      expiry: '08/28',
                      balance: walletCubit.balance!,
                    ),
                    const SizedBox(height: 7),
                    const TransactionsButtonRow(),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          l10n.transaction,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontWeight: .w600),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouting.rHistoryView);
                          },
                          child: Text(
                            l10n.seeAll,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.purple),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<LedgerCubit, LedgerState>(
                      builder: (context, state) {
                        if (state is LedgerSuccessState) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.ledgerModel.length.clamp(0, 4),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              return RecentTransactionListBody(
                                ledgerModel: state.ledgerModel[index],
                              );
                            },
                          );
                        } else if (state is LedgerEmptyState) {
                          return Center(
                            child: Text(
                              S.of(context).noTransactionsYet,
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(color: AppColors.grey400),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
