import 'package:flutter/material.dart';

import '../database/entities/enum_spread_category.dart';

class SpreadDialog extends StatefulWidget {
  const SpreadDialog({super.key});

  @override
  State<SpreadDialog> createState() => _SpreadDialogState();
}

class _SpreadDialogState extends State<SpreadDialog>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: SpreadCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.amber[700],
            child: TabBar(
              labelPadding: const EdgeInsets.all(5),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              unselectedLabelColor: Colors.black87,
              indicatorColor: Colors.amber[900],
              labelColor: Colors.grey[600],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: const EdgeInsets.all(5),
              isScrollable: true,
              controller: _tabController,
              tabs: SpreadCategory.values
                  .map(
                    (category) => Text(
                      category.toString(),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: SpreadCategory.values
                  .map(
                    (category) => GridView.extent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 4 / 3,
                      shrinkWrap: true,
                      children: category.spreads
                          .map(
                            (shape) => Card(
                              elevation: 5.0,
                              color: Colors.amberAccent[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GridTile(
                                footer: Center(
                                  child: Text(
                                    shape.toString(),
                                  ),
                                ),
                                child: Icon(
                                  Icons.book,
                                  size: 60.0,
                                  color: Colors.amber[900],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange[900]!),
                  ),
                  onPressed: () {},
                  child: const SizedBox(
                    width: 50,
                    child: Center(
                      child: Text('OK'),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber[900]!),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const SizedBox(
                    width: 50,
                    child: Center(
                      child: Text('Cancel'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
