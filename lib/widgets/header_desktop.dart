import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/widgets/site_logo.dart';
import '../constants/colors.dart';
import '../constants/nav_items.dart';
import '../constants/sns_links.dart';
import '../styles/style.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  int? _hoveredIndex;
  bool _isResumeHovered = false;

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
    return Container(
      height: 65.0,
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 30.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
              widget.onNavMenuTap(0);
            },
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = i),
                onExit: (_) => setState(() => _hoveredIndex = null),
                child: TextButton(
                  onPressed: () {
                    widget.onNavMenuTap(i);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: _hoveredIndex == i
                        ? CustomColor.whiteSecondary.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  child: Text(
                    navTitles[i],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          _hoveredIndex == i ? FontWeight.bold : FontWeight.w500,
                      color: _hoveredIndex == i
                          ? CustomColor.accentCyan
                          : CustomColor.whitePrimary,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(width: 8),

          // Resume Button in Top Header Navbar
          MouseRegion(
            onEnter: (_) => setState(() => _isResumeHovered = true),
            onExit: (_) => setState(() => _isResumeHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                gradient: CustomColor.buttonGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: _isResumeHovered
                    ? [
                        BoxShadow(
                          color: CustomColor.accentPurple.withOpacity(0.6),
                          blurRadius: 12,
                          spreadRadius: 1,
                        )
                      ]
                    : [],
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _openResume,
                icon: const Icon(
                  Icons.description_outlined,
                  size: 18,
                  color: Colors.white,
                ),
                label: const Text(
                  "Resume",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
