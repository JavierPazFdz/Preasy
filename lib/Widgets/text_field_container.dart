import 'package:flutter/material.dart';


class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 250,),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _createCardShape(),
      child: child,
    ),
  );

  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );
}