import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/views/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController prod_controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double deviceWidth = constraints.maxWidth;
          double fontSize = deviceWidth * 0.05;
          EdgeInsets padding = EdgeInsets.all(deviceWidth * 0.03);

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Shopstick',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    if (deviceWidth >= 350)
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.view_list_rounded),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.grid_view),
                            onPressed: () {},
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Obx(() => Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                      ),
                      padding: EdgeInsets.all(15),
                      itemCount: prod_controller.productList.length,
                      itemBuilder: (context, index) {
                        return ProductTile(prod_controller.productList[index]);
                      },
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
