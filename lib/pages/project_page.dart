import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/project/open_project_provider.dart';
import '../widgets/elements_sidebar.dart';
import '../widgets/journal_widget.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) =>
              Text(ref.watch(openProjectProvider)!.name),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = MediaQuery.of(context).size;
          if (size.height > size.width) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 300.0),
                  child: const ElementsSidebar(),
                ),
                const VerticalDivider(
                  width: 2,
                  thickness: 2,
                ),
                const Expanded(
                  child: JournalWidget(),
                ),
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 300),
                  child: const ElementsSidebar(),
                ),
                const VerticalDivider(
                  width: 2,
                  thickness: 2,
                ),
                const Expanded(
                  flex: 3,
                  child: JournalWidget(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
