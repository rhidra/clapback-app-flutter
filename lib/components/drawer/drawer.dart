import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120,
            child: DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('Rémy Hidra'),
                subtitle: Text('remy.hidra@gmail.com'),
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 8)],
              ),
            ),
          ),
          ListTile(
              title: Text('Grid'),
              onTap: () {},
              leading: Icon(Icons.apps, color: Colors.red)),
          Divider(),
          ListTile(
              title: Text('Activity'),
              onTap: () {},
              leading: Icon(Icons.message, color: Colors.red)),
          Divider(),
          ListTile(
              title: Text('Settings'),
              onTap: () {},
              leading: Icon(Icons.settings, color: Colors.red)),
          Divider(),
        ],
      ),
    );
  }
}
