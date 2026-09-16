import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/contact_section.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.onNavMenuTop});

  final Function(int) onNavMenuTop;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // intro message
              const Text(
                "Hi,\nI'm PREMKUMAR\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              // contact btn
              SizedBox(
                width: 250.0,
                child: ElevatedButton(
                  onPressed: () {
                    onNavMenuTop(3);
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactSection()));
                  },
                  child: const Text("Get in touch"),
                ),
              )
            ],
          ),
          // avatar img
          Image.asset(
            "assets/my_flutter_avatar.png",
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
