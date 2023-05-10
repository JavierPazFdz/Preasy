import 'package:flutter/material.dart';

import 'widgets.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const _PurpleBox(),
            const _HeaderImage(),
            child,
          ],
        ));
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          child: const CircleAvatar(
            maxRadius: 100,
            backgroundImage: AssetImage('lib/assets/logo_preasy.jpg'),
          )),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _purpleBackground(),
        child: Stack(children: [
          Positioned(top: 90, left: 30, child: _Bubble()),
          Positioned(top: -40, left: -30, child: _Bubble()),
          Positioned(top: -50, right: -20, child: _Bubble()),
          Positioned(bottom: -50, left: 10, child: _Bubble()),
          Positioned(bottom: 120, right: 20, child: _Bubble()),
        ]));
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
