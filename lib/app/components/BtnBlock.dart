import 'package:flutter/material.dart';

class BtnBlock extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback act;
  const BtnBlock(
      {Key? key, required this.text, required this.color, required this.act})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: const Size.fromHeight(70), // NEW
      ),
      onPressed: act,
      child: Text(
        text,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
