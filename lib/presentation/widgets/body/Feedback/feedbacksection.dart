import 'package:flutter/material.dart';

class FeedBackSection extends StatelessWidget {
  const FeedBackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.greenAccent,
      child: const Row(
        children: [Text('This is Feedback section')],
      ),
    );
  }
}
