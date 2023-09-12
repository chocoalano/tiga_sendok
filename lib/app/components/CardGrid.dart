import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback act;
  const CardGrid(
      {Key? key,
      required this.icon,
      required this.color,
      required this.act,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: act,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width / 5,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: width / 27, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
