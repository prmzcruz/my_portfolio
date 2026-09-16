import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';
import '../constants/sns_links.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;

  Future<void> _openResume() async {
    if (SnsLinks.resume.isNotEmpty) {
      final uri = Uri.parse(SnsLinks.resume);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: SafeArea(
        child: Column(
          children: [
            // Close button header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return CustomColor.primaryGradient.createShader(bounds);
                    },
                    child: const Text(
                      "PRMz",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: CustomColor.whiteSecondary.withOpacity(0.15)),

            // Nav Items List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  for (int i = 0; i < navTitles.length; i++)
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 4.0,
                      ),
                      leading: Icon(
                        navIcons[i],
                        color: CustomColor.accentCyan,
                      ),
                      title: Text(
                        navTitles[i],
                        style: const TextStyle(
                          color: CustomColor.whitePrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () => onNavItemTap(i),
                    ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: CustomColor.buttonGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: _openResume,
                        icon: const Icon(
                          Icons.description_outlined,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Download Resume / CV",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
