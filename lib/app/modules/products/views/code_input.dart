import 'package:flutter/material.dart';

class CodeInputField extends StatelessWidget {
  final String hint;
  final bool isHidden;
  final Function onSaved;
  final Function onTap;
  final TextEditingController controller;
  final Function validator;

  const CodeInputField({
    super.key,
    required this.hint,
    required this.onSaved,
    required this.onTap,
    this.isHidden = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: const EdgeInsets.only(top: 10),
        child: Row(children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              obscureText: isHidden,
              // initialValue: "srp",
              decoration: InputDecoration(
                label: Text(hint),
                alignLabelWithHint: true,
                hintStyle: const TextStyle(fontSize: 12),
                border: const OutlineInputBorder(),
                filled: true,
              ),
              controller: controller,
              textInputAction: TextInputAction.next,
              validator: (value) {
                return validator(value);
              },
              onSaved: (value) {
                onSaved(value);
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(child: const Icon(Icons.camera_alt), onTap: () {
            onTap();
          },)
        ]));
  }
}
