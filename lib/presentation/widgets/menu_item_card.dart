import 'package:flutter/material.dart';

import '../../core/router/menu_items.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.menuItem});
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(menuItem.title, textAlign: TextAlign.center,),
        leading: menuItem.leading,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
            return menuItem.screenDestination;
          },));
        },
      ),
    );
  }
}