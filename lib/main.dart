import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hunger_dashboard/pages/HungerPage.dart';
import 'firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
          appBar: AppBar(title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HungerPage()));
              },
              child:Container(child: Text('Hunger Blog'),),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HungerPage()));
              },
              child:Container(child: Text('Zip Code/State'),),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HungerPage()));
              },
              child:Container(child: Text('Subscriptions'),),),

          ],)),
          body: Center(child: HungerPage())),
    );
  }
}
