import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/widgets/custom_icon_button.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {

  final double balance;

  const BankCard({super.key,  required this.balance});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '${l10n.goodMorning} 👋',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            const Spacer(),
            CustomIconButton(
              backGroundColor: AppColors.grey400,
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icons.settings,
            ),
          ],
        ),

        const SizedBox(height: 15),
        AspectRatio(
          aspectRatio: 1.900,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                  Color(0xFF0F3460),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0F3460).withValues(alpha: 0.5),
                  blurRadius: 20,

                  offset: const Offset(0, 11),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -60,
                  left: -20,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.04),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    children: [
                      Text(
                        l10n.totalBalance,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        '${l10n.egp} ${balance.toStringAsFixed(2)}',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge!.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
