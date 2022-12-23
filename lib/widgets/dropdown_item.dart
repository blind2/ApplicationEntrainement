import 'package:flutter/material.dart';

// Define a custom Form widget.
class DropdownItem extends StatefulWidget {
  DropdownItem({super.key});

  String selectedValue = "LBS";

  @override
  State<DropdownItem> createState() {
    return _DropdownItemState();
  }
}

class _DropdownItemState extends State<DropdownItem> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "LBS",
          child: Text("LBS", style: TextStyle(color: Colors.grey))),
      const DropdownMenuItem(
          value: "KG",
          child: Text(
            "KG",
            style: TextStyle(color: Colors.grey),
          )),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 44, 44, 44),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        dropdownColor: const Color.fromARGB(255, 44, 44, 44),
        value: widget.selectedValue,
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedValue = newValue!;
          });
        },
      )),
    );
  }
}
