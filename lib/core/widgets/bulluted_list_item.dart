import 'package:Linko/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BullutedListItem extends StatelessWidget {
  const BullutedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("\u2022", style: TextStyle(fontSize: 40, color: AppColors.subTitleColor)),
        SizedBox(
          width: 5,
        ),
        Text(
          "Fibers",
          style: TextStyle(color: AppColors.subTitleColor, fontSize: 15),
        )
      ],
    );
  }
}
