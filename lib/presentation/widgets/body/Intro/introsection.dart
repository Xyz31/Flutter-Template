import 'package:flutter/material.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({super.key});

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.amber,
      child: const Row(
        children: [Text('This is Intro')],
      ),
    );
  }
}
