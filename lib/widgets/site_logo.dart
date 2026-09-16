import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 3.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _isHovered
              ? Matrix4.translationValues(0, -2, 0)
              : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.accentCyan.withOpacity(0.4),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/site_logo.png",
                        height: 32,
                        width: 32,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: CustomColor.accentPurple,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.phone_android_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              ShaderMask(
                shaderCallback: (bounds) {
                  return CustomColor.primaryGradient.createShader(bounds);
                },
                child: const Text(
                  "PRMz",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
