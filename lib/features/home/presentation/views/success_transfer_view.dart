import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/success_transfer_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessTransferView extends StatelessWidget {
  const SuccessTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouting.rHomeView);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SuccessTransferViewBody(),
    );
  }
}
