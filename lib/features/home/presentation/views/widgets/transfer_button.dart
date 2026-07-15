import 'package:e_wallet/core/services/biometric_service.dart';
import 'package:e_wallet/core/services/service_locator.dart';
import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/core/widgets/custom_form_field.dart';
import 'package:e_wallet/features/home/presentation/controller/transaction_cubit/transaction_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/transaction_cubit/transaction_state.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transaction_bottom_sheet.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/transactions_button.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TransferButton extends StatefulWidget {
  const TransferButton({super.key});

  @override
  State<TransferButton> createState() => _TransferButtonState();
}

class _TransferButtonState extends State<TransferButton> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    amountController.dispose();
    receiverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Expanded(
      child: TransactionsButton(
        onTap: () {
          final transferCubit = context.read<TransactionCubit>();

          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            builder: (context) => BlocProvider.value(
              value: transferCubit,
              child: BlocConsumer<TransactionCubit, TransactionStates>(
                listener: (context, state) {
                  if (state is TransferSuccessStates) {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRouting.rSuccessTransferView);
                  }
                  if (state is TransferFailureStates) {
                    SnackBar snackBar = SnackBar(
                      content: Text(state.errMessage.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    GoRouter.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: TransactionBottomSheet(
                      primaryField: CustomFormField(
                        controller: receiverController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return l10n.phoneValidation;
                          }
                          if (value.length != 11) {
                            return l10n.phoneLengthValidation;
                          }
                          return null;
                        },
                        inputType: TextInputType.phone,
                        hintText: l10n.sendTo,
                        prefixIcon: Icons.person_outline,
                      ),
                      secondaryField: CustomFormField(
                        controller: amountController,
                        inputType: TextInputType.number,
                        hintText: l10n.amount,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.amountValidation;
                          }

                          final amount = double.tryParse(value);

                          if (amount == null) {
                            return l10n.amountValidation;
                          }

                          if (amount <= 0) {
                            return l10n.amountValidation;
                          }

                          return null;
                        },
                        prefixIcon: Icons.payments_outlined,
                      ),
                      buttonText: l10n.continueButton,
                      onTap: () async {
                        if (!formKey.currentState!.validate()) return;

                        final authenticated = await getIt<BiometricService>()
                            .biometricAuth();

                        if (!authenticated) return;

                        if (!context.mounted) return;
                        context.read<TransactionCubit>().transfer(
                          receiverPhone: receiverController.text.trim(),
                          amount: double.parse(amountController.text.trim()),
                        );
                      },
                      isLoading: state is TransferLoadingStates,
                    ),
                  );
                },
              ),
            ),
          );
        },
        containerColor: Colors.red,
        iconBackgroundColor: Colors.red,
        icon: Icons.arrow_outward_rounded,
        text: l10n.transfer,
        shadowColor: Colors.redAccent,
        textColor: Colors.red,
      ),
    );
  }
}
