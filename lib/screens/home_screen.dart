import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName='Home';

  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
        drawer: const SideMenu(),
        body: const Center(
          child: Text('HomeScreen'),
        )

    );
  }
}