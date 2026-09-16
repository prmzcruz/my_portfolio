import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'main_desktop.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, required this.onNavMenuTop});
  final Function(int) onNavMenuTop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(26, 38, 26, 62),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(child: Container(width: width * .76, decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), gradient: const LinearGradient(colors: [Color(0xFF263B67), Color(0xFF121B34)]), border: Border.all(color: CustomColor.border)), child: ClipRRect(borderRadius: BorderRadius.circular(27), child: Image.asset('assets/my_flutter_avatar.png')))),
        const SizedBox(height: 34),
        const HeroEyebrow(),
        const SizedBox(height: 18),
        const Text('I build polished\nmobile experiences.', style: TextStyle(fontSize: 38, height: 1.1, fontWeight: FontWeight.w900, letterSpacing: -1.2)),
        const SizedBox(height: 16),
        const Text('Flutter developer crafting fast, thoughtful products that feel as good as they function.', style: TextStyle(color: CustomColor.whiteSecondary, fontSize: 16, height: 1.55)),
        const SizedBox(height: 28),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => onNavMenuTop(3), icon: const Icon(Icons.send_rounded, size: 18), label: const Text('Let’s work together'))),
      ]),
    );
  }
}
