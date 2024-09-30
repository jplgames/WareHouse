import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product.dart';

class ProductsController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final productskey = GlobalKey<FormState>();
  late String cnpj;
  late RxBool isLoading = false.obs;
  var products = <Product>[].obs;
  RxBool isOverlayVisible = false.obs;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDataController = TextEditingController();

  @override
  onInit() async {
    super.onInit();
    try {
      final userUid = _auth.currentUser!.uid;
      final doc = await _instance.collection('users').doc(userUid).get();
      final data = doc.data() as Map<String, dynamic>;
      cnpj = data['cnpj'];
      log('CNPJ: $cnpj');
    } catch (e) {
      log('Erro ao obter dados do cnpj: $e');
    }
    fetchProducts();
  }

  fetchProducts() async {
    _instance
        .collection('/company/00000000000/product')
        .snapshots()
        .listen((snapshot) {
      products.value =
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    });
  }

  @override
  void dispose() {
    productNameController.dispose();
    productCodeController.dispose();
    productPriceController.dispose();
    productDataController.dispose();
    super.dispose();
  }

  void showOverlay() {
    isOverlayVisible.value = true;
  }

  void hideOverlay() {
    isOverlayVisible.value = false;
  }

  String? productNameValidation(String productName) {
    if (productName.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? productCodeValidation(String code) {
    if (code.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? productPriceValidation(String price) {
    if (price.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? productDataValidation(String data) {
    if (data.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  Future<void> register() async {
    isLoading.value = true;
    log('[CONTROLLER] Cadastrando produto: ${productNameController.text}');
    final bool isValid = productskey.currentState!.validate();
    if (!isValid) {
      return;
    }
    productskey.currentState!.save();

    var product = Product(
      name: productNameController.text,
      code: productCodeController.text,
      price: productPriceController.text,
      data: productDataController.text,
    ).toJson();

    try {
      log(product['code']);
      await _instance
          .collection('company')
          .doc(cnpj)
          .collection('product')
          .doc(product['code'])
          .set(product);
      log('Produto registrado com sucesso: ${productNameController.text}');
      Get.snackbar('[SUCESSO]', 'Produto registrado com sucesso');
      productNameController.clear();
      productCodeController.clear();
      productPriceController.clear();
      productDataController.clear();
      isLoading.value = false;
      hideOverlay();
    } catch (e) {
      isLoading.value = false;
      log('Erro ao cadastrar produto: $e');
    }
  }
}
