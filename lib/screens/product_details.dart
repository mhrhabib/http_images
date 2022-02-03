import 'package:flutter/material.dart';
import 'package:http_tuto/services/product_service.dart';

class ProductDetails extends StatefulWidget {
  int id;
  ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Future singleProduct;

  @override
  void initState() {
    singleProduct = ProductService().getSingleProducts(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: singleProduct,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data['title']),
                  Container(
                    child: Image.network(snapshot.data['image']),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
