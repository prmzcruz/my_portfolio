import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Platforms Column
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 480,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Platforms & Solutions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.accentCyan,
                  ),
                ),
              ),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  for (int i = 0; i < platformItems.length; i++)
                    _AnimatedPlatformCard(
                      img: platformItems[i]["img"]!,
                      title: platformItems[i]["title"]!,
                      subtitle: platformItems[i]["subtitle"]!,
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),

        // Skills Column
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 520,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Technologies & Tools",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.accentPurple,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      _AnimatedSkillChip(
                        img: skillItems[i]["img"]!,
                        title: skillItems[i]["title"]!,
                      ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _AnimatedPlatformCard extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;

  const _AnimatedPlatformCard({
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  State<_AnimatedPlatformCard> createState() => _AnimatedPlatformCardState();
}

class _AnimatedPlatformCardState extends State<_AnimatedPlatformCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 220,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        transform: _isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered ? CustomColor.cardBg : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? CustomColor.accentCyan.withOpacity(0.8)
                : CustomColor.whiteSecondary.withOpacity(0.12),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? CustomColor.accentCyan.withOpacity(0.25)
                  : Colors.black.withOpacity(0.2),
              blurRadius: _isHovered ? 15 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomColor.scaffoldBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                widget.img,
                width: 26.0,
                height: 26.0,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: _isHovered
                          ? CustomColor.accentCyan
                          : CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: CustomColor.whiteSecondary,
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

class _AnimatedSkillChip extends StatefulWidget {
  final String img;
  final String title;

  const _AnimatedSkillChip({required this.img, required this.title});

  @override
  State<_AnimatedSkillChip> createState() => _AnimatedSkillChipState();
}

class _AnimatedSkillChipState extends State<_AnimatedSkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
        transform: _isHovered
            ? Matrix4.translationValues(0, -3, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered
              ? CustomColor.accentPurple.withOpacity(0.2)
              : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isHovered
                ? CustomColor.accentPurple
                : CustomColor.whiteSecondary.withOpacity(0.12),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.accentPurple.withOpacity(0.3),
                    blurRadius: 12,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              widget.img,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: _isHovered
                    ? CustomColor.accentCyan
                    : CustomColor.whitePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
