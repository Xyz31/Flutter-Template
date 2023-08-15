import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.lightBlue,
      child: const Row(
        children: [Text('This is About Me')],
      ),
    );
  }
}
