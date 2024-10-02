import 'package:flutter/material.dart';

import '../values/colors.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final bool isHidden;
  final Function onSaved;
  final TextEditingController controller;
  final Function validator;

  const CustomInputField({
    super.key,
    required this.hint,
    required this.onSaved,
    this.isHidden = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(top: 10),
      child: buildTextFormField(),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      obscureText: isHidden,
      // initialValue: "srp",
      decoration: buildInputDecoration(),
      controller: controller,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        onSaved(value);
      },
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        label: Text(hint),
        alignLabelWithHint: true,
        hintStyle: const TextStyle(fontSize: 12),
        border: const OutlineInputBorder(),
        filled: true);
  }
}
class AmountInputField extends StatelessWidget {
  final Function onSaved;
  final TextEditingController controller;
  final Function validator;
  const AmountInputField(
      {super.key,
      required this.onSaved,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Amount',
        labelStyle: TextStyle(color: buttonGreen),
        hintText: 'Min. 2, Max. 200000',
      ),
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        onSaved(value);
      },
      keyboardType: TextInputType.number,
    );
  }
}

class DetailInputField extends StatelessWidget {
  final Function onSaved;
  final TextEditingController controller;
  final Function validator;
  const DetailInputField(
      {super.key,
      required this.onSaved,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Detail',
        labelStyle: TextStyle(color: buttonGreen),
      ),
      maxLines: 3,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        onSaved(value);
      },
    );
  }
}
