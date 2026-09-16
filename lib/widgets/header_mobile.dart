import 'package:flutter/material.dart';

import '../styles/style.dart';
import 'site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: const EdgeInsets.fromLTRB(18, 14, 18, 0),
      padding: const EdgeInsets.only(left: 4, right: 6),
      decoration: kHederDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu_rounded)),
        ],
      ),
    );
  }
}
