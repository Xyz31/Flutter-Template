import 'package:flutter/material.dart';

import 'package:flutter_my_template/presentation/widgets/body/Footer/footersection.dart';
import 'package:flutter_my_template/presentation/widgets/body/Intro/introsection.dart';

import 'presentation/widgets/body/AboutMe/aboutmesectin.dart';
import 'presentation/widgets/body/Feedback/feedbacksection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      child: const Column(
        children: [
          IntroSection(),
          AboutSection(),
          FeedBackSection(),
          FooterSection(),
        ],
      ),
    );
  }
}
