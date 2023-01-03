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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
            flex: 1,
            child: ElementsSidebar(),
          ),
          VerticalDivider(
            width: 2,
            thickness: 2,
          ),
          Expanded(
            flex: 3,
            child: JournalWidget(),
          ),
        ],
      ),
    );
  }
}
