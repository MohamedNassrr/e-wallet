import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';

class SuccessTransferViewBody extends StatelessWidget {
  const SuccessTransferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: Colors.green[300],
          child: const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 55,
            child: Icon(Icons.check, size: 40, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Column(
            spacing: 5,
            children: [
              Text(
                S.of(context).thankYou,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                S.of(context).transactionSuccessful,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
