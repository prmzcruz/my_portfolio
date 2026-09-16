import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';
import '../styles/style.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      decoration: kHederDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () => onNavMenuTap(0)),
          const Spacer(),
          for (var i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: TextButton(
                onPressed: () => onNavMenuTap(i),
                style: TextButton.styleFrom(
                  foregroundColor: CustomColor.whiteSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                child: Text(navTitles[i], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
        ],
      ),
    );
  }
}
