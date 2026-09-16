import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.onNavMenuTop});
  final Function(int) onNavMenuTop;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      constraints: const BoxConstraints(minHeight: 590),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(right: 60, top: 35, child: _glow(const Color(0x558B5CF6), 300)),
          Positioned(left: screenWidth * .33, bottom: 35, child: _glow(const Color(0x3367E8F9), 220)),
          Row(
            children: [
              Expanded(
                flex: 11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeroEyebrow(),
                    const SizedBox(height: 22),
                    const Text('I build polished\nmobile experiences.', style: TextStyle(fontSize: 54, height: 1.08, fontWeight: FontWeight.w900, letterSpacing: -1.8)),
                    const SizedBox(height: 22),
                    const SizedBox(width: 510, child: Text('Flutter developer crafting fast, thoughtful products that feel as good as they function.', style: TextStyle(color: CustomColor.whiteSecondary, fontSize: 18, height: 1.6))),
                    const SizedBox(height: 34),
                    Wrap(spacing: 14, runSpacing: 12, children: [
                      ElevatedButton.icon(onPressed: () => onNavMenuTop(3), icon: const Icon(Icons.send_rounded, size: 18), label: const Text('Let’s work together')),
                      OutlinedButton(onPressed: () => onNavMenuTop(2), style: OutlinedButton.styleFrom(foregroundColor: CustomColor.whitePrimary, side: const BorderSide(color: CustomColor.border), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: const Text('View selected work')),
                    ]),
                    const SizedBox(height: 42),
                    const Wrap(spacing: 12, children: [_Stat('Flutter', 'specialist'), _Stat('Android · iOS', 'multi-platform')]),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), gradient: const LinearGradient(colors: [Color(0xFF263B67), Color(0xFF121B34)]), border: Border.all(color: const Color(0xFF435885)), boxShadow: const [BoxShadow(color: Color(0x66000000), blurRadius: 36, offset: Offset(0, 20))]),
                    child: ClipRRect(borderRadius: BorderRadius.circular(31), child: Image.asset('assets/my_flutter_avatar.png', fit: BoxFit.contain)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _glow(Color color, double size) => IgnorePointer(child: Container(width: size, height: size, decoration: BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [BoxShadow(color: color, blurRadius: 90, spreadRadius: 36)])));
}

class HeroEyebrow extends StatelessWidget {
  const HeroEyebrow();
  @override
  Widget build(BuildContext context) => const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.waving_hand_rounded, color: CustomColor.yellowSecondary, size: 17), SizedBox(width: 9), Text('HELLO, I’M PREMKUMAR', style: TextStyle(color: CustomColor.yellowSecondary, fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.5))]);
}

class _Stat extends StatelessWidget {
  const _Stat(this.title, this.subtitle);
  final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), decoration: BoxDecoration(color: CustomColor.bgLight1, borderRadius: BorderRadius.circular(12), border: Border.all(color: CustomColor.border)), child: RichText(text: TextSpan(children: [TextSpan(text: '$title  ', style: const TextStyle(color: CustomColor.whitePrimary, fontWeight: FontWeight.w800)), TextSpan(text: subtitle, style: const TextStyle(color: CustomColor.whiteSecondary, fontSize: 12))])));
}
