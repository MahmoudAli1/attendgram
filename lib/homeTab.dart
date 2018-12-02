import 'package:flutter/material.dart';
import 'event_info_page.dart';
class homeTab extends StatelessWidget {
  final items = List<String>.generate(10, (i) => "Item $i");
  homeTab();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            onTap: () {
              Navigator.of(context).pushNamed(EventInfoPage.tag);
            },
          );
        },
      ),
    );
  }
}

