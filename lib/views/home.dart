import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the device width to make responsive adjustments
          double deviceWidth = constraints.maxWidth;

          double fontSize = deviceWidth * 0.05; // Adjust the multiplier as needed
          EdgeInsets padding = EdgeInsets.all(deviceWidth * 0.03); // Adjust the multiplier as needed

          return Column(
            children: [
              Padding(
                padding: padding,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ShopX',
                        style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    if (deviceWidth >= 350) // Display only on larger screens (tablets)
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
             Expanded(
             child:
             
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,  // two columns
              mainAxisSpacing: 5
              
              ), 
              padding: EdgeInsets.all(15),
              itemBuilder: (_, index) {
                return Container(
                  padding: padding,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(15)
                  ),
                );
              }),
          ),
          ],
          );
        },
      ),
    );
  }
}
