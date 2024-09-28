

import 'package:flutter/material.dart';
import 'package:flutter_application_api_4/controller/home_screen_controller.dart';
import 'package:flutter_application_api_4/view/home_screen/product_details_screen/product_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerObj = context.watch<HomeScreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeScreenController>().fetchProducts();
        },
      ),
      body: Builder(
        builder: (context) {
          if (providerObj.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (providerObj.myProducts.isEmpty) {
            return Center(child: Text("No data"));
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetialsScreen(
                                id: providerObj.myProducts[index].id.toString(),
                              ),
                            ));
                      },
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            Image.network(
                              providerObj.myProducts[index].image.toString(),
                              height: 150,
                            ),
                            Text(
                                providerObj.myProducts[index].title.toString()),
                            Text(providerObj.myProducts[index].id.toString()),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: providerObj.myProducts.length);
          }
        },
      ),
    );
  }
}
