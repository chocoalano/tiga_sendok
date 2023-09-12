import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final controller;
  final String labelName;
  final String hint;
  final Color coloroff;
  final Color coloron;
  const TxtField(
      {Key? key,
      required this.hint,
      required this.coloroff,
      required this.coloron,
      required this.labelName,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            labelName,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: coloroff, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: coloron, width: 1.0),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: hint),
          ),
        ),
      ],
    );
  }
}
