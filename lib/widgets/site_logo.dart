import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('<', style: TextStyle(color: CustomColor.yellowSecondary, fontSize: 20, fontWeight: FontWeight.w800)),
            Text('PK', style: TextStyle(color: CustomColor.whitePrimary, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 1)),
            Text('/>', style: TextStyle(color: CustomColor.yellowPrimary, fontSize: 20, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}
