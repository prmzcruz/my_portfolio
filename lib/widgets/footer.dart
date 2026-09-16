import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CustomColor.scaffoldBg,
        border: Border(
          top: BorderSide(
            color: CustomColor.whiteSecondary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Designed & Built with Flutter ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: CustomColor.whiteSecondary,
                ),
              ),
              const Icon(
                Icons.favorite_rounded,
                color: CustomColor.accentPink,
                size: 14,
              ),
              const Text(
                " by ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: CustomColor.whiteSecondary,
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) {
                  return CustomColor.primaryGradient.createShader(bounds);
                },
                child: const Text(
                  "PREMKUMAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            "© ${DateTime.now().year} All rights reserved.",
            style: TextStyle(
              fontSize: 12,
              color: CustomColor.whiteSecondary.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
