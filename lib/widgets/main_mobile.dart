import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/sns_links.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, required this.onNavMenuTop});

  final Function(int) onNavMenuTop;

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty || url == "https://") return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Card with Glowing Gradient Border
          SizedBox(
            width: screenWidth * 0.75,
            height: screenWidth * 0.9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Ambient Glow
                Container(
                  width: screenWidth * 0.7,
                  height: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        CustomColor.accentPurple.withOpacity(0.4),
                        CustomColor.accentCyan.withOpacity(0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                // Card Image
                Container(
                  width: screenWidth * 0.65,
                  height: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.accentCyan.withOpacity(0.6),
                        CustomColor.accentPurple.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.accentPurple.withOpacity(0.35),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                "assets/my_flutter_avatar.png",
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: 70,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      CustomColor.scaffoldBg.withOpacity(0.85),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Floating Badge
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: CustomColor.accentCyan.withOpacity(0.5),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/flutter.png",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Welcome Badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: CustomColor.accentPurple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: CustomColor.accentPurple.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: CustomColor.accentCyan,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "👋 Welcome to my portfolio",
                  style: TextStyle(
                    color: CustomColor.accentCyan,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Name & Title
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 30,
                height: 1.3,
                fontWeight: FontWeight.w800,
                color: CustomColor.whitePrimary,
              ),
              children: [
                const TextSpan(text: "Hi, I'm "),
                WidgetSpan(
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return CustomColor.primaryGradient.createShader(bounds);
                    },
                    child: const Text(
                      "PREMKUMAR",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TextSpan(text: "\n"),
                WidgetSpan(
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(colors: [
                        CustomColor.accentCyan,
                        CustomColor.accentPurple,
                      ]).createShader(bounds);
                    },
                    child: const Text(
                      "A Flutter Developer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          const Text(
            "Building beautiful, high-performance cross-platform mobile & web applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 24),

          // Action Buttons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: CustomColor.buttonGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.accentPurple.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () => onNavMenuTop(3),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text("Get in touch"),
                ),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
                onPressed: () => onNavMenuTop(2),
                icon: const Icon(Icons.folder_open_rounded, size: 18),
                label: const Text("View Projects"),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: CustomColor.accentCyan,
                  side: const BorderSide(
                      color: CustomColor.accentCyan, width: 1.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
                onPressed: () => _launchUrl(SnsLinks.resume),
                icon: const Icon(Icons.download_rounded, size: 18),
                label: const Text("Download CV"),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Social Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIconButton("assets/github.png", SnsLinks.github),
              const SizedBox(width: 12),
              _buildSocialIconButton("assets/linkedin.png", SnsLinks.linkedIn),
              const SizedBox(width: 12),
              _buildSocialIconButton(
                  "assets/instagram.png", SnsLinks.instagram),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton(String iconPath, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CustomColor.bgLight1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CustomColor.whiteSecondary.withOpacity(0.15),
            width: 1,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 22,
          height: 22,
        ),
      ),
    );
  }
}
