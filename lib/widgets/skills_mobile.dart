import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Platforms & Solutions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.accentCyan,
            ),
          ),
          const SizedBox(height: 12),
          // platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: CustomColor.whiteSecondary.withOpacity(0.12),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CustomColor.scaffoldBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      platformItems[i]["img"]!,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        platformItems[i]["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      Text(
                        platformItems[i]["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 28),

          const Text(
            "Technologies & Tools",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.accentPurple,
            ),
          ),
          const SizedBox(height: 12),

          // skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.start,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 14.0,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: CustomColor.whiteSecondary.withOpacity(0.12),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        skillItems[i]["img"]!,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skillItems[i]["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
