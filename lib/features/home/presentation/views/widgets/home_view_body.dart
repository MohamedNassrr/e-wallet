import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_state.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/bank_card.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/recent_transaction_list_body.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transactions_button_row.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocConsumer<WalletCubit, WalletStates>(
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
                      onPressed: () {},
                      child: Text(
                        l10n.seeAll,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.purple),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const RecentTransactionListBody(),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsetsGeometry.only(top: 10),
                    ),
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
