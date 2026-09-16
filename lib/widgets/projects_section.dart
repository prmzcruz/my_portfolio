import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) => Container(width: double.infinity, padding: const EdgeInsets.fromLTRB(25, 76, 25, 88), child: Column(children: [
    const Text('Selected work', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: CustomColor.whitePrimary)),
    const SizedBox(height: 14),
    const Text('A selection of products I’ve helped bring to life.', style: TextStyle(color: CustomColor.whiteSecondary)),
    const SizedBox(height: 42),
    ConstrainedBox(constraints: const BoxConstraints(maxWidth: 930), child: Wrap(spacing: 20, runSpacing: 20, children: [for (final project in workProjectUtils) ProjectCardWidget(project: project)])),
  ]));
}
