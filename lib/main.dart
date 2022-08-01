import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => 'Pakistan',
          ),
          Provider(
            create: (context) => 'Punjab',
          ),
        ],
        child: MaterialApp(
          home: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<String>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Provider=' + myProvider),
          ),
        ],
      ),
    );
  }
}
//So here you can see that it always approch to closed provider,its because it seraches on the base of type(Exact type)
//In this Example under bulid provider was of String type and in main there were two types of String,and in tree "Punjab" was closest and it gave us that
//Thats the glitch of provider ,on the other hand riverpod seraches on the base of object thats why it always return that object that we want
