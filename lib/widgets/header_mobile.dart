import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../styles/style.dart';
import 'site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.0,
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(
              Icons.menu_rounded,
              color: CustomColor.whitePrimary,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
