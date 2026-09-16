import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> sendEmail() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String message = _messageController.text.trim();

    if (name.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in your name and message."),
          backgroundColor: CustomColor.accentPink,
        ),
      );
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'premkumar848934@gmail.com',
      queryParameters: {
        'subject': 'New Contact Request from $name',
        'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Could not open email client."),
          ),
        );
      }
    }
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
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      color: CustomColor.bgLight1.withOpacity(0.5),
      child: Column(
        children: [
          // Section Tag Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: CustomColor.accentCyan.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: CustomColor.accentCyan.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: const Text(
              "📬 GET IN TOUCH",
              style: TextStyle(
                color: CustomColor.accentCyan,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Title
          const Text(
            "Let's Work Together",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Have a project in mind or want to connect? Send a message below!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 40),

          // Form Box
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 720,
            ),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: CustomColor.whiteSecondary.withOpacity(0.12),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth >= kMinDesktopWidth) {
                        return buildNameEmailFieldDesktop();
                      }
                      return buildNameEmailFieldMobile();
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _messageController,
                    hintText: "Your message...",
                    prefixIcon: Icons.chat_bubble_outline_rounded,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Container(
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: sendEmail,
                        icon: const Icon(Icons.send_rounded, size: 20),
                        label: const Text("Send Message"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Divider(
              color: CustomColor.whiteSecondary.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 20),

          // SNS icon button links
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildSnsButton("GitHub", "assets/github.png", SnsLinks.github),
              _buildSnsButton(
                  "LinkedIn", "assets/linkedin.png", SnsLinks.linkedIn),
              _buildSnsButton(
                  "Instagram", "assets/instagram.png", SnsLinks.instagram),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSnsButton(String label, String iconPath, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: CustomColor.whiteSecondary.withOpacity(0.15),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your Name",
            prefixIcon: Icons.person_outline_rounded,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your Email",
            prefixIcon: Icons.email_outlined,
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextField(
          controller: _nameController,
          hintText: "Your Name",
          prefixIcon: Icons.person_outline_rounded,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _emailController,
          hintText: "Your Email",
          prefixIcon: Icons.email_outlined,
        ),
      ],
    );
  }
}
