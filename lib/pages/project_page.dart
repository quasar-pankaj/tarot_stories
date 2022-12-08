import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/open_project_provider.dart';
import 'page_base.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openProject = ref.watch(openProjectProvider);

    return PageBase(
      title: openProject!.name,
      body: Column(
        children: [
          Row(),
          Consumer(
            builder: (context, ref, child) {
              return const Spacer();
            },
          ),
        ],
      ),
      fabIcon: Icons.add,
      fabToolTip: 'Add New Spread',
      onFABPressed: () {},
    );
  }
}
