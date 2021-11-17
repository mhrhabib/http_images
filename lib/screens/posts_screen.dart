import 'package:flutter/material.dart';
import 'package:http_tuto/models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future data;

  Future getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    PostModel posts = PostModel(url);
    data = posts.fetchData();
    // data.then((value) {
    //   print(value[0]);
    // });

    return data;
  }

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data[0]['title']);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
