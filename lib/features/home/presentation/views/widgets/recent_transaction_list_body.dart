import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionListBody extends StatelessWidget {
  const RecentTransactionListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: const BoxDecoration(
        borderRadius: .all(.circular(8)),
        color: Colors.white,
      ),
      child: const Row(children: [Text('transfer')]),
    );
  }
}
