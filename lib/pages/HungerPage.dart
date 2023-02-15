import 'package:flutter/material.dart';

import '../components/HungerBlogCard.dart';

class HungerPage extends StatefulWidget {
  const HungerPage({Key? key}) : super(key: key);

  @override
  State<HungerPage> createState() => _HungerPageState();
}

class _HungerPageState extends State<HungerPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: HungerBlogCard(

    ),
      ),);
  }
}
