import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/widgets/custom_icon_button.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_state.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocConsumer<WalletCubit, WalletStates>(
      listener: (context, state) {
        if (state is FetchWalletFailureStates || state is WalletFailureStates) {
          SnackBar snackBar = const SnackBar(
            content: Text('failure in wallet service'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is FetchWalletSuccessStates) {
          var walletCubit = state.walletModel;
          return Padding(
            padding: const EdgeInsets.all(27),
            child: Column(
              spacing: 10,
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 327.w,
                  height: 138.h,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        l10n.totalBalance,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        '${walletCubit.balance}',
                        style: Theme.of(context).textTheme.displayLarge!
                            .copyWith(color: AppColors.white),
                      ),
                      Row(
                        mainAxisAlignment: .end,
                        children: [
                          CustomIconButton(
                            backGroundColor: AppColors.white,
                            onPressed: () {},
                            icon: Icons.arrow_forward_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      l10n.transaction,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(fontWeight: .w600),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.seeAll,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'confirm',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppColors.blue),
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
