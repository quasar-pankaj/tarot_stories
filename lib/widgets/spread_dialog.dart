import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_spread_category.dart';
import '../database/entities/spread.dart';
import '../providers/spreads/open_spread_provider.dart';
import '../providers/spreads/spreads_provider.dart';
import '../spread_icons/four_card_vert_layout.dart';

class SpreadDialog extends ConsumerStatefulWidget {
  const SpreadDialog({super.key});

  @override
  ConsumerState<SpreadDialog> createState() => _SpreadDialogState();
}

class _SpreadDialogState extends ConsumerState<SpreadDialog>
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
      backgroundColor: Colors.amber[50],
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
                            (shape) => InkWell(
                              onTap: () async {
                                final spread = await ref
                                    .read(spreadProvider.notifier)
                                    .addNew(shape);
                                ref.read(openSpreadProvider.notifier).update(
                                      (state) => spread,
                                    );

                                if (!mounted) return;
                                Navigator.of(context).pop();
                              },
                              child: Card(
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
                                  child: const FourCardVertLayout(
                                    label1: '1',
                                    label2: '2',
                                    label3: '3',
                                    label4: '4',
                                  ),
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
                  onPressed: () => Navigator.pop(
                    context,
                  ),
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
