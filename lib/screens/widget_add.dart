import 'package:flutter/material.dart';

class AddFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: Icon(
        Icons.fastfood,
        color: Colors.blue,
        size: 45.0,
      ),
      title: Text(
        'aaaa',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(" Carbs"),
      trailing: Container(
        width: 200.0,
        child: Row(
          children: <Widget>[
            SizedBox(width: 20.0),
            Text('BAT'),
            SizedBox(
              width: 30.0,
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      dense: true,
    ));
  }
}
