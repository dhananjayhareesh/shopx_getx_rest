import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/productcontroller.dart';
import 'package:shopping_app/views/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final productController productcontroller = Get.put(productController());

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productcontroller.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: Get.find<productController>().productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          Get.find<productController>().productList[index]);
                    },
                    staggeredTileBuilder: (index) =>
                        const StaggeredTile.fit(1));
            }),
          )
        ],
      ),
    );
  }
}
