import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/button_theme.dart';
import '../../../core/theme/imput_theme.dart';
import '../../../core/theme/layoutbar.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  final _storeController = Get.find<StoreController>();

  StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    if (_storeController.settingsService.storecnpj.value == '') {
      return LayoutBar(
          route: '/home',
          body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
              const Text('Registre sua loja aqui!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Form(
                  key: _storeController.storeKey,
                  child: Column(
                      children: [_nameForm(), _cnpjForm(), _adreessForm()])),
              SizedBox(height: 50),
              SubmitButton(
                onTap: () {
                  _storeController.register();
                },
                title: 'Registre-se',
                buttonColor: const Color.fromARGB(101, 124, 90, 235),
              )
            ])),
          ));
    } else {
      return LayoutBar(route: '/home', body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Bem vindo a sua loja')
            ],
          )
        )
      ));
    }
  }

  CustomInputField _nameForm() {
    return CustomInputField(
      hint: 'Nome da empresa',
      controller: _storeController.storeNameController,
      validator: (name) {
        return _storeController.storeNameValidation(name);
      },
      onSaved: (name) {
        _storeController.storeNameController.text = name;
      },
    );
  }

  CustomInputField _cnpjForm() {
    return CustomInputField(
      hint: 'Digite seu CNPJ',
      controller: _storeController.cnpjNumberController,
      validator: (cnpj) {
        return _storeController.cnpjValidation(cnpj);
      },
      onSaved: (cnpj) {
        _storeController.cnpjNumberController.text = cnpj;
      },
    );
  }

  CustomInputField _adreessForm() {
    return CustomInputField(
      hint: 'Digite seu endereço',
      controller: _storeController.addressController,
      validator: (address) {
        return _storeController.addressValidation(address);
      },
      onSaved: (address) {
        _storeController.addressController.text = address;
      },
    );
  }
}
