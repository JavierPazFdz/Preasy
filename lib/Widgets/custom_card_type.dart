

import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          leading: Icon(Icons.abc_sharp),
          title: Text('Nombre del proyecto'),
          subtitle: Text('Descripcion del proyecto'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {}, 
                child: const Text('Cancel'),       
              ),
              TextButton(
                onPressed: () {}, 
                child: const Text('Ok'),
              )
              ],
          ),
        )
      ],
    ));
  }
}
