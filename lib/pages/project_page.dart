import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Project Spreads'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                ListTile(
                  title: const TextField(),
                  leading: const Icon(
                    Icons.search,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
