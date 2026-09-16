import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 60),
      child: Column(
        children: [
          // Section Tag Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: CustomColor.accentPurple.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: CustomColor.accentPurple.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: const Text(
              "🚀 PORTFOLIO SHOWCASE",
              style: TextStyle(
                color: CustomColor.accentPurple,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Title
          const Text(
            "Featured Work Projects",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Enterprise and commercial mobile applications I have engineered.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 40),

          // Work projects cards grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 60),

          // Hobby / Personal projects section
          /*const Text(
            "Personal & Mobile Apps",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Side projects, utilities, and experimental Flutter applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: hobbyProjectUtils[i],
                  ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
