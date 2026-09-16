import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 316,
      width: 286,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: CustomColor.bgLight2,
        border: Border.all(color: CustomColor.border),
        boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 18, offset: Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // project img
          Image.asset(
            project.image,
            height: 150,
            width: 286,
            fit: BoxFit.cover,
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 17, 16, 8),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          // footer
          Container(
            color: CustomColor.surface,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                const Text(
                  "EXPLORE ON",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                if (project.iosLink?.isNotEmpty ?? false)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.iosLink]);
                    },
                    child: Image.asset(
                      "assets/ios_icon.png",
                      width: 19,
                    ),
                  ),
                if (project.androidLink?.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.androidLink]);
                      },
                      child: Image.asset(
                        "assets/android_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
                if (project.webLink?.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLink]);
                      },
                      child: Image.asset(
                        "assets/web_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
