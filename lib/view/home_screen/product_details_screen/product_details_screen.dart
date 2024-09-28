

import 'package:flutter/material.dart';
import 'package:flutter_application_api_4/controller/product_details_screen_controller.dart';
import 'package:provider/provider.dart';

class ProductDetialsScreen extends StatefulWidget {
  const ProductDetialsScreen({super.key, required this.id});
  final String id;

  @override
  State<ProductDetialsScreen> createState() => _ProductDetialsScreenState();
}

class _ProductDetialsScreenState extends State<ProductDetialsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<ProductDetialsScreenController>()
            .getProductDetails(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provoderObj = context.watch<ProductDetialsScreenController>();
    return Scaffold(
      body: provoderObj.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Image.network(
                  provoderObj.selectedProduct!.image.toString(),
                  height: 150,
                ),
                Text(provoderObj.selectedProduct!.title.toString()),
                Text(provoderObj.selectedProduct!.id.toString()),
              ],
            ),
    );
  }
}
