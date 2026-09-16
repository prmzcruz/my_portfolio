import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Designed & built by PREMKUMAR  •  Flutter developer",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: CustomColor.whiteSecondary,
        ),
      ),
    );
  }
}
