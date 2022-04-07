import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleButton extends StatelessWidget {
  SingleButton(
      {Key? key,
      required this.placeholder,
      required this.col,
      required this.pressAction})
      : assert(col == "green" || col == "white"),
        super(key: key);

  final String placeholder;
  final String col;
  final Function pressAction;

  Color green = const Color.fromARGB(255, 11, 11, 11);
  Color white = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    if (col == "green") {
      return TextButton(
          onPressed: () {
            pressAction();
          },
          child: Text(
            placeholder,
          ),
          style: TextButton.styleFrom(
            primary: white,
            backgroundColor: green,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            minimumSize: const Size.fromHeight(50),
          ));
    } else {
      return TextButton(
          onPressed: () {
            pressAction();
          },
          child: Text(
            placeholder,
          ),
          style: TextButton.styleFrom(
            primary: green,
            backgroundColor: white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            minimumSize: const Size.fromHeight(50),
          ));
    }
  }
}

class SingleTextInput extends StatelessWidget {
  SingleTextInput(
      {Key? key, required this.placeholder, required this.controller})
      : super(key: key);

  final String placeholder;
  final TextEditingController controller;

  Color green = const Color.fromARGB(255, 6, 6, 6);
  Color white = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        backgroundColor: Colors.grey[300],
        color: green,
      ),
      decoration: InputDecoration(
        isDense: true,
        // contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.grey[300],
        hintStyle: TextStyle(color: green),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        hintText: placeholder,
      ),
    );
  }
}
