import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard(
      {required this.itemPrice,
      required this.itemName,
      required this.itemDate});
  double itemPrice = 0;
  String itemName = "";
  String itemDate = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              minRadius: 40,
              maxRadius: 40,
              child: Text("\$$itemPrice"),
            ),
            title: Text(itemName),
            subtitle: Text(itemDate),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_forever),
            ),
          ),
        ),
      ),
    );
  }
}
