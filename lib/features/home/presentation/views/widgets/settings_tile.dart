import 'package:e_wallet/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    required this.trailing,
      this.onTap,
  });
  final IconData icon;
  final String title;
  final Widget? subTitle;
  final Widget trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          shape: .rectangle,
          borderRadius: const BorderRadius.all(.circular(10)),
          border: Border.all(color: AppColors.grey300),
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 6, right: 3),
          leading: Icon(icon, color: AppColors.teal),
          title: Text(title, style: Theme.of(context).textTheme.labelMedium),
          subtitle: subTitle,
          trailing: trailing,
        ),
      ),
    );
  }
}
