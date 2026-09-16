import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});
  @override
  Widget build(BuildContext context) => Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
    ConstrainedBox(constraints: const BoxConstraints(maxWidth: 500), child: Wrap(spacing: 12, runSpacing: 12, children: [for (final item in platformItems) _PlatformCard(item: item)])),
    const SizedBox(width: 58),
    Flexible(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 460), child: _SkillCloud())),
  ]);
}
class _PlatformCard extends StatelessWidget { const _PlatformCard({required this.item}); final Map item; @override Widget build(BuildContext context) => Container(width: 238, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: CustomColor.bgLight2, border: Border.all(color: CustomColor.border), borderRadius: BorderRadius.circular(16)), child: Row(children: [Container(width: 44, height: 44, padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: CustomColor.surface, borderRadius: BorderRadius.circular(11)), child: Image.asset(item['img'])), const SizedBox(width: 13), Text(item['title'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15))])); }
class _SkillCloud extends StatelessWidget { @override Widget build(BuildContext context) => Wrap(spacing: 10, runSpacing: 10, children: [for (final item in skillItems) Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: CustomColor.surface, border: Border.all(color: CustomColor.border), borderRadius: BorderRadius.circular(12)), child: Row(mainAxisSize: MainAxisSize.min, children: [Image.asset(item['img'], width: 22, height: 22), const SizedBox(width: 8), Text(item['title'], style: const TextStyle(fontWeight: FontWeight.w600))]))]); }
