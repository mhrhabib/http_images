import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_tuto/screens/product_details.dart';
import 'package:http_tuto/services/product_service.dart';

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Store"),
      ),
      body: FutureBuilder(
        future: ProductService().getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            id: snapshot.data[index]['id'],
                          ),
                        ),
                      );
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        snapshot.data[index]['image'],
                        fit: BoxFit.fitHeight,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    title: Text(snapshot.data[index]['title']),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
