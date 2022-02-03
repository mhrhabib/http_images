import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_tuto/models/image_model.dart';

import 'package:http_tuto/widgets/image_list.dart';

import 'screens/posts_screen.dart';
import 'screens/store_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoreHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<ImageModel> images = [];
  Future<void> fetchImage() async {
    counter++;
    final url =
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    final response = await http.get(url);
    final imageModel =
        ImageModel.fromJson(json.decode(response.body) as Map<String, dynamic>);
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("api images"),
      ),
      body: ImageList(images: images),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchImage();
        },
        child: const Text('Click'),
      ),
    );
  }
}
