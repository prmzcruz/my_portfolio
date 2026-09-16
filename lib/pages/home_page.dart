import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import '../constants/size.dart';

import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 300 && !_showBackToTop) {
        setState(() => _showBackToTop = true);
      } else if (scrollController.offset <= 300 && _showBackToTop) {
        setState(() => _showBackToTop = false);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        floatingActionButton: AnimatedScale(
          scale: _showBackToTop ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutBack,
          child: Container(
            decoration: BoxDecoration(
              gradient: CustomColor.buttonGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: CustomColor.accentPurple.withOpacity(0.5),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOutCubic,
                );
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            // Ambient Background Subtle Gradient Light Orbs
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      CustomColor.accentPurple.withOpacity(0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: -150,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      CustomColor.accentCyan.withOpacity(0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Scrollable Body Content
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),

                  // HEADER
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    HeaderDesktop(onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    })
                  else
                    HeaderMobile(
                      onLogoTap: () => scrollToSection(0),
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),

                  // HERO MAIN
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    MainDesktop(
                      onNavMenuTop: (int navIndex) {
                        scrollToSection(navIndex);
                      },
                    )
                  else
                    MainMobile(
                      onNavMenuTop: (int navIndex) {
                        scrollToSection(navIndex);
                      },
                    ),

                  const SizedBox(height: 40),

                  // SKILLS
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1.withOpacity(0.7),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: CustomColor.whiteSecondary.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Section Tag Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: CustomColor.accentCyan.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: CustomColor.accentCyan.withOpacity(0.4),
                              width: 1,
                            ),
                          ),
                          child: const Text(
                            "💻 TECHNICAL EXPERTISE",
                            style: TextStyle(
                              color: CustomColor.accentCyan,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Section title
                        const Text(
                          "What I Can Do",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Specialized in cross-platform mobile development and scalable solutions.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColor.whiteSecondary,
                          ),
                        ),
                        const SizedBox(height: 50),

                        // Platforms & Skills
                        if (constraints.maxWidth >= kMedDesktopWidth)
                          const SkillsDesktop()
                        else
                          const SkillsMobile(),
                      ],
                    ),
                  ),

                  // PROJECTS
                  ProjectsSection(
                    key: navbarKeys[2],
                  ),

                  // CONTACT
                  ContactSection(
                    key: navbarKeys[3],
                  ),

                  // FOOTER
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<void> scrollToSection(int navIndex) async {
    if (navIndex == 4) {
      // Blog page
      if (SnsLinks.blog.isNotEmpty && SnsLinks.blog != "https://") {
        final uri = Uri.parse(SnsLinks.blog);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      } else {
        // Scroll to projects if blog is not configured
        scrollToSection(2);
      }
      return;
    }

    if (navIndex < navbarKeys.length) {
      final key = navbarKeys[navIndex];
      if (key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }
}
