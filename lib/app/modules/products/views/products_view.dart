// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore: unused_import
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/imput_theme.dart';
import '../controllers/products_controller.dart';

// ignore: must_be_immutable
class ProductsView extends GetView<ProductsController> {
  ProductsView({super.key});

  late OverlayEntry _overlayEntry;
  // ignore: prefer_final_fields
  RxBool _isPressed = false.obs;
  final _productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    final _products = controller.products.obs;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                if (_isPressed.value) {
                  _productsController.register();
                  _overlayEntry.remove();
                  _isPressed.value = false;
                  Get.offNamed('/home');
                } else {
                  Get.offNamed('/home');
                }
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? Colors.white.withOpacity(0.03)
                        : Colors.black.withOpacity(0.03),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              )),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Produtos:', style: TextStyle(fontSize: 20)),
          Expanded(
              child: Obx(() => Container(
                  child: _products.value.isEmpty
                      ? const Center(child: Text('Nenhum produto cadastrado'))
                      : ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: _products.value.length,
                          itemBuilder: (context, int index) {
                            var product = _products.value[index];
                            return productsCardModel(
                                product.name ?? 'Sem Nome',
                                product.code ?? 'Sem Codigo',
                                product.price ?? 'Sem preço',
                                product.data ?? 'Sem data',
                                index,
                                context);
                          })))),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Obx(
                () => FloatingActionButton(
                    onPressed: () => {
                          if (_isPressed.value == false)
                            {
                              _addProductOverlay(context),
                              _isPressed.value = true,
                              controller.showOverlay(),
                            }
                          else
                            {_overlayEntry.remove(), _isPressed.value = false}
                        },
                    child: _isPressed.value
                        ? const Icon(Icons.close)
                        : const Icon(Icons.add)),
              ),
            ),
          ])
        ]));
  }

  productsCardModel(name, code, price, data, index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('hello world');
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2010865486.
        _editProductOverlay(context, index);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 216, 71, 245),
              Color.fromARGB(255, 104, 74, 143)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xD4FFFFFF)),
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
                            color: Color(0xFFFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'CODIGO: $code',
                        style: const TextStyle(
                            color: Color(0xFF1D1D1D), fontSize: 10),
                      )
                    ])),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  price,
                  style:
                      const TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  data,
                  style:
                      const TextStyle(color: Color(0xFFAAAAAA), fontSize: 10),
                ),
                GestureDetector(
                  onTap: () {
                    _removeProductOverlay(context, index);
                  },
                  child: const Icon(
                    Icons.remove_circle,
                    color: Color(0xFFAAAAAA),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  _addProductOverlay(BuildContext build) async {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0,
        left: 50.0,
        right: 50.0,
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.productskey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _productNameForm(),
                  _productCodeForm(),
                  _productPriceForm(),
                  _productDateForm(),
                  const SizedBox(height: 20),
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            controller.register();
                          },
                          child: const Text('Registrar produto'),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(build).insert(_overlayEntry);
  }

  _removeProductOverlay(
    BuildContext build,
    int item,
  ) async {
    // ignore: unnecessary_null_comparison
    if (item < 0 || item >= controller.products.length) {
      Get.snackbar('[ERRO]', 'Não va tão rapido');
      return;
    }
    log(controller.products[item].name.toString());
    controller.showOverlay();
    _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
              top: 100.0,
              left: 30.0,
              right: 30.0,
              child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const Text('Remover Produto ?'),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Obx(() {
                                if (!controller.deleteProgress.value) {
                                  return Row(children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          controller.delete(item);
                                        },
                                        child: const Text('Remover Produto')),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                        onPressed: () {
                                          _overlayEntry.remove();
                                        },
                                        child: const Text('Cancelar'))
                                  ]);
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              }),
                            ],
                          ),
                          Obx(() {
                            if (!controller.isOverlayVisible.value) {
                              _overlayEntry.remove();
                            }
                            return Container();
                          })
                        ])),
                  )),
            ));
    Overlay.of(build).insert(_overlayEntry);
  }

  _editProductOverlay(BuildContext build, int item) async {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0,
        left: 50.0,
        right: 50.0,
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _overlayEntry.remove();
                      },
                      child: const Icon(Icons.close),
                    )
                  ],
                ),
                Form(
                  key: controller.editKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller.productNameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome do Produto',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: controller.productCodeController,
                        decoration: const InputDecoration(
                          labelText: 'Preço do produto',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: controller.productPriceController,
                        decoration: const InputDecoration(
                          labelText: 'Data validade',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () {
                          controller.showOverlay();
                          if (controller.isLoading.value &&
                              controller.isOverlayVisible.value) {
                            return const CircularProgressIndicator();
                          } else if (!controller.isOverlayVisible.value) {
                            _overlayEntry.remove();
                          } else {
                            return ElevatedButton(
                              onPressed: () {
                                controller.edit(controller.products[item].code);
                              },
                              child: const Text('Salvar'),
                            );
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    Overlay.of(build).insert(_overlayEntry);
  }

  CustomInputField _productNameForm() {
    return CustomInputField(
      hint: 'Nome do Produto',
      controller: controller.productNameController,
      validator: (productName) {
        return controller.productNameValidation(productName);
      },
      onSaved: (productName) {
        controller.productNameController.text = productName;
      },
    );
  }

  CustomInputField _productCodeForm() {
    return CustomInputField(
      hint: 'Codigo do Produto',
      controller: controller.productCodeController,
      validator: (productCode) {
        return controller.productCodeValidation(productCode);
      },
      onSaved: (productCode) {
        controller.productCodeController.text = productCode;
      },
    );
  }

  CustomInputField _productPriceForm() {
    return CustomInputField(
      hint: 'Preco do Produto',
      controller: controller.productPriceController,
      validator: (productPrice) {
        return controller.productPriceValidation(productPrice);
      },
      onSaved: (productPrice) {
        controller.productPriceController.text = productPrice;
      },
    );
  }

  CustomInputField _productDateForm() {
    return CustomInputField(
      hint: 'Data do Produto',
      controller: controller.productDataController,
      validator: (productData) {
        return controller.productDataValidation(productData);
      },
      onSaved: (productDate) {
        controller.productDataController.text = productDate;
      },
    );
  }
}
