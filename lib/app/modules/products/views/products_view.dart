import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/layoutbar.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutBar(
        route: '/home', 
        body: Column(children: [Text('Produtos')]));
  }
}
