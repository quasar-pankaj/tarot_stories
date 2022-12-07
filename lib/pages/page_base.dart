import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final String _title;
  final List<Widget>? _actions;
  final Widget _body;
  final IconData _fabIcon;
  final void Function()? _onFABPressed;
  final String _fabToolTip;
  const PageBase(
      {super.key,
      required String title,
      required Widget body,
      required IconData fabIcon,
      required String fabToolTip,
      required void Function()? onFABPressed,
      List<Widget>? actions})
      : _title = title,
        _body = body,
        _onFABPressed = onFABPressed,
        _fabIcon = fabIcon,
        _fabToolTip = fabToolTip,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: _actions,
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
        body: _body,
        floatingActionButton: FloatingActionButton(
          onPressed: _onFABPressed,
          tooltip: _fabToolTip,
          child: Icon(
            _fabIcon,
          ),
        ),
      ),
    );
  }
}
