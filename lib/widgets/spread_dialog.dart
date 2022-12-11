import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 6, vsync: this);
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
            color: Colors.purple,
            child: TabBar(
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              unselectedLabelColor: const Color(0xffacb3bf),
              indicatorColor: const Color(0xFFffac81),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: const EdgeInsets.all(5),
              isScrollable: true,
              controller: _tabController,
              tabs: const [
                Text('Character'),
                Text('Structure'),
                Text('Scene/Sequel'),
                Text('Location'),
                Text('Prop'),
                Text('Relationship'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Text('Character'),
                Text('Structure'),
                Text('Scene/Sequel'),
                Text('Location'),
                Text('Prop'),
                Text('Relationship'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
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
                  onPressed: () {},
                  child: const SizedBox(
                    width: 50,
                    child: Center(
                      child: Text('Cancel'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
