// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, annotate_overrides
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExampleApp()));
}

class ExampleApp extends StatefulWidget {
  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  String currentPage = "Home";
  
  Widget build(BuildContext context) {
    Widget appBody = Center(child: Text("Hello World!", textScaleFactor: 3));
    
    if (currentPage == "Horse"){
      appBody = Image.network("https://mitch.website/horse.jpg");
    }
    
    Widget app = Scaffold(
      body: appBody,
      appBar: AppBar(title: Text("This is my app :3")),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text("Menu", textScaleFactor: 2),
            ),
            ListTile(
              title: Text("Home"),
              onTap: (){
                setState((){
                  currentPage = "Home";
                });
                Navigator.pop(context);
              }
            ),
            ListTile(
              title: Text("Horse"),
              onTap: (){
                setState((){
                  currentPage = "Horse";
                });
                Navigator.pop(context);
              }
            )
          ]
        )
      )
    );

    return app;
  }
}
