import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/project_list_provider.dart';
import '../widgets/in_place_editor.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarot Stories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffa2d2ff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Tarot for Writers'),
                accountEmail: Text('quasar.pankaj@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('Tarot'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: const Color(0xffffc8dd),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Hello World $index'),
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('An App for Writers © Pankaj Agarwal'),
                ),
              ),
            ],
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final list = ref.watch(projectListProvider);
            return GridView.extent(
              maxCrossAxisExtent: 100,
              children: list
                  .map(
                    (e) => Card(
                      child: GridTile(
                        footer: Center(child: InPlaceEditor(text: e.name)),
                        child: const Icon(
                          Icons.analytics_outlined,
                          size: 80.6,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => ref.read(projectListProvider.notifier).addNew()),
          tooltip: 'Add new Project',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
