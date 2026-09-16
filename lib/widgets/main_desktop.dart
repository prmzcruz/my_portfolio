import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/sns_links.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key, required this.onNavMenuTop});

  final Function(int) onNavMenuTop;

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatingController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _floatingController,
        curve: Curves.easeInOut,
      ),
    );

    _pulseAnimation = Tween<double>(begin: 0.25, end: 0.55).animate(
      CurvedAnimation(
        parent: _floatingController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _floatingController.dispose();
    super.dispose();
  }

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
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      height: screenHeight / 1.15,
      constraints: const BoxConstraints(
        minHeight: 520.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text & Actions column with Fade-in Animation
          Expanded(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 800),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, (1 - value) * 20),
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
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
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Greeting & Name Title with Gradient
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 42,
                        height: 1.25,
                        fontWeight: FontWeight.w800,
                        color: CustomColor.whitePrimary,
                        fontFamily: 'Roboto',
                      ),
                      children: [
                        const TextSpan(text: "Hi,\n"),
                        WidgetSpan(
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return CustomColor.primaryGradient
                                  .createShader(bounds);
                            },
                            child: const Text(
                              "I'm PREMKUMAR",
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 1.0,
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
                              "Flutter Developer",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Subtitle
                  const Text(
                    "Building beautiful, high-performance cross-platform mobile & web applications with Dart, Flutter, & Firebase.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _AnimatedPrimaryButton(
                        onTap: () => widget.onNavMenuTop(3),
                        label: "Get in touch",
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                        ),
                        onPressed: () => widget.onNavMenuTop(2),
                        icon: const Icon(Icons.folder_open_rounded, size: 20),
                        label: const Text("View Projects"),
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: CustomColor.accentCyan,
                          side: const BorderSide(
                              color: CustomColor.accentCyan, width: 1.5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                        ),
                        onPressed: () => _launchUrl(SnsLinks.resume),
                        icon: const Icon(Icons.download_rounded, size: 20),
                        label: const Text("Download CV"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Quick Social Links
                  Row(
                    children: [
                      _buildSocialIconButton(
                          "assets/github.png", SnsLinks.github),
                      const SizedBox(width: 12),
                      _buildSocialIconButton(
                          "assets/linkedin.png", SnsLinks.linkedIn),
                      const SizedBox(width: 12),
                      _buildSocialIconButton(
                          "assets/instagram.png", SnsLinks.instagram),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(width: 50),

          // Floating Profile Card with Pulse & Infinite Hover Animation
          AnimatedBuilder(
            animation: _floatingController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatingAnimation.value),
                child: SizedBox(
                  width: screenWidth / 3.2,
                  height: screenWidth / 2.7,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      // Ambient Glow Background Circle with Pulsing Opacity
                      Container(
                        width: screenWidth / 3.4,
                        height: screenWidth / 3.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              CustomColor.accentPurple
                                  .withOpacity(_pulseAnimation.value),
                              CustomColor.accentCyan.withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      // Main Profile Image Card with Glowing Gradient Border
                      Container(
                        width: screenWidth / 4.6,
                        height: screenWidth / 4.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
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
                              blurRadius: 30,
                              spreadRadius: 2,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColor.bgLight1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      "assets/my_flutter_avatar.png",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  // Subtle Dark Blend at the bottom
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    height: 90,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            CustomColor.scaffoldBg
                                                .withOpacity(0.85),
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

                      // Floating Tech Badge Top-Right: "Flutter Developer 💙"
                      Positioned(
                        top: 55 + (_floatingAnimation.value * 0.3),
                        right: -15,
                        child: _buildFloatingBadge(
                          iconPath: "assets/flutter.png",
                          text: "Flutter Developer",
                          badgeColor: CustomColor.accentCyan,
                        ),
                      ),

                      // Floating Tech Badge Bottom-Left: "Android & iOS 🚀"
                      Positioned(
                        bottom: 55 - (_floatingAnimation.value * 0.3),
                        left: -20,
                        child: _buildFloatingBadge(
                          iconPath: "assets/android_icon.png",
                          text: "Android & iOS",
                          badgeColor: CustomColor.accentPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBadge({
    required String iconPath,
    required String text,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: CustomColor.bgLight1.withOpacity(0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: badgeColor.withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton(String iconPath, String url) {
    return _HoverIconButton(
      iconPath: iconPath,
      onTap: () => _launchUrl(url),
    );
  }
}

class _AnimatedPrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String label;

  const _AnimatedPrimaryButton({required this.onTap, required this.label});

  @override
  State<_AnimatedPrimaryButton> createState() => _AnimatedPrimaryButtonState();
}

class _AnimatedPrimaryButtonState extends State<_AnimatedPrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? Matrix4.translationValues(0, -3, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          gradient: CustomColor.buttonGradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CustomColor.accentPurple.withOpacity(_isHovered ? 0.6 : 0.4),
              blurRadius: _isHovered ? 22 : 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 18,
            ),
          ),
          onPressed: widget.onTap,
          icon: AnimatedPadding(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.only(left: _isHovered ? 6.0 : 0.0),
            child: const Icon(Icons.arrow_forward_rounded, size: 20),
          ),
          label: Text(widget.label),
        ),
      ),
    );
  }
}

class _HoverIconButton extends StatefulWidget {
  final String iconPath;
  final VoidCallback onTap;

  const _HoverIconButton({required this.iconPath, required this.onTap});

  @override
  State<_HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<_HoverIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _isHovered
              ? CustomColor.accentPurple.withOpacity(0.2)
              : CustomColor.bgLight1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? CustomColor.accentCyan
                : CustomColor.whiteSecondary.withOpacity(0.15),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.accentCyan.withOpacity(0.3),
                    blurRadius: 10,
                  )
                ]
              : [],
        ),
        child: InkWell(
          onTap: widget.onTap,
          child: Image.asset(
            widget.iconPath,
            width: 22,
            height: 22,
          ),
        ),
      ),
    );
  }
}
