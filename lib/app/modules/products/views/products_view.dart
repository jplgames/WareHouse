import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus.go/app/modules/products/product.dart';

import '../../../core/theme/layoutbar.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> _products = [
      Product('Macaco Hidraulico', '05050505448', 'RS 50,00', '01/01/2023'),
      Product('Pneu Pirelle', '05050505448', 'RS 50,00', '01/01/2023'),
      Product('Limpador de Parabrisa', '05050505448', 'RS 50,00', '01/01/2023'),
      Product('Shampoo Carro', '05050505448', 'RS 50,00', '01/01/2023'),
      Product('Lata de Cerveja', '05050505448', 'RS 50,00', '01/01/2023'),
    ];

    return LayoutBar(
        route: '/home',
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Produtos:', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: _products.length,
                itemBuilder: (context, int index) {
                  return productsCardModel(
                      _products[index].name,
                      _products[index].code,
                      _products[index].price,
                      _products[index].data);
                }),
          )
        ]));
  }

  productsCardModel(name, code, price, data) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: const Color(0xFFD8D8D8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            color: const Color(0x7C19BEFF),
            width: 75,
            height: 75,
          ),
          SizedBox(
              width: 230,
              height: 75,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 0, 10)),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'CODIGO: $code',
                      style: const TextStyle(
                          color: Color(0xFF8B8B8B), fontSize: 10),
                    )
                  ])),
          Container(
            margin: const EdgeInsets.only(right: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                price,
                style: const TextStyle(color: Color(0xFF006D00), fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                data,
                style: const TextStyle(color: Color(0xFF707070), fontSize: 10),
              )
            ]),
          )
        ],
      ),
    );
  }
}
