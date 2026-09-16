import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import '../constants/colors.dart';

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool _isHovered = false;

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty || url == "https://") return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        height: 320,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomColor.bgLight1,
          border: Border.all(
            color: _isHovered
                ? CustomColor.accentCyan.withOpacity(0.6)
                : CustomColor.whiteSecondary.withOpacity(0.12),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? CustomColor.accentCyan.withOpacity(0.2)
                  : Colors.black.withOpacity(0.2),
              blurRadius: _isHovered ? 20 : 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image Header with gradient overlay
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Stack(
                children: [
                  Image.asset(
                    widget.project.image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            CustomColor.bgLight1.withOpacity(0.9),
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

            // Title & Description
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
              child: Text(
                widget.project.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  widget.project.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.4,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
              ),
            ),

            // Footer Availability Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: CustomColor.bgLight2.withOpacity(0.6),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: Row(
                children: [
                  const Text(
                    "Platforms:",
                    style: TextStyle(
                      color: CustomColor.accentCyan,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (widget.project.androidLink != null &&
                      widget.project.androidLink!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () => _launchUrl(widget.project.androidLink),
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: CustomColor.scaffoldBg,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.asset(
                            "assets/android_icon.png",
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  if (widget.project.iosLink != null &&
                      widget.project.iosLink!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () => _launchUrl(widget.project.iosLink),
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: CustomColor.scaffoldBg,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.asset(
                            "assets/ios_icon.png",
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  if (widget.project.webLink != null &&
                      widget.project.webLink!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () => _launchUrl(widget.project.webLink),
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: CustomColor.scaffoldBg,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.asset(
                            "assets/web_icon.png",
                            width: 16,
                            height: 16,
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
