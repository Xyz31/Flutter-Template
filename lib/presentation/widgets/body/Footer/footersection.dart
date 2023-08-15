import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.purple,
      child: const Row(
        children: [Text('This is Fooetr section')],
      ),
    );
  }
}
