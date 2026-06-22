import 'package:e_wallet/core/widgets/custom_form_field.dart';
import 'package:e_wallet/features/home/presentation/controller/transaction_cubit/transaction_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/transaction_cubit/transaction_state.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transaction_bottom_sheet.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transactions_button.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositButton extends StatefulWidget {
  const DepositButton({super.key});

  @override
  State<DepositButton> createState() => _DepositButtonState();
}

class _DepositButtonState extends State<DepositButton> {
  final TextEditingController depositAmountController = TextEditingController();
  @override
  void dispose() {
    depositAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Expanded(
      child: TransactionsButton(
        onTap: () {
          var depositCubit = context.read<TransactionCubit>();
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            builder: (context) => BlocProvider.value(
              value: depositCubit,
              child: BlocBuilder<TransactionCubit, TransactionStates>(
                builder: (context, state) {
                  return TransactionBottomSheet(
                    primaryField: CustomFormField(
                      controller: depositAmountController,
                      inputType: TextInputType.number,
                      hintText: l10n.amount,
                      prefixIcon: Icons.payments_outlined,
                    ),
                    buttonText: l10n.continueButton,
                    onTap: () {
                      depositCubit.deposit(
                        amount: double.parse(
                          depositAmountController.text.trim(),
                        ),
                      );
                    },
                    isLoading: false,
                  );
                },
              ),
            ),
          );
        },
        containerColor: Colors.green,
        iconBackgroundColor: Colors.green,
        icon: Icons.call_received_rounded,
        text: l10n.deposit,
        shadowColor: Colors.green,
        textColor: Colors.green,
      ),
    );
  }
}
