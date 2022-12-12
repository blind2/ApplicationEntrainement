import 'package:flutter/material.dart';

// Define a custom Form widget.
class DropdownItem extends StatefulWidget {
  const DropdownItem({super.key});

  @override
  State<DropdownItem> createState() {
    return _DropdownItemState();
  }
}

class _DropdownItemState extends State<DropdownItem> {
  String selectedValue = "LBS";

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
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 44, 44),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        dropdownColor: const Color.fromARGB(255, 44, 44, 44),
        value: selectedValue,
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
      )),
    );
  }
}
