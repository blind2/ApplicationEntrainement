// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ExerciceDetailScreen extends StatelessWidget {
  const ExerciceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          leadingWidth: 100,
          title: const Text(
            'Details',
            style: TextStyle(color: Color.fromARGB(255, 47, 38, 38)),
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gym.jpg"), fit: BoxFit.fill),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                    style: const TextStyle(color: Colors.white),
                    //controller: dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      labelText: "Veuillez entrez une date",
                      labelStyle: TextStyle(color: Colors.white),

                      //label text of field
                    ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                    }),
                const SizedBox(height: 30),
                const TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    //controller: dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: Icon(Icons.numbers, color: Colors.white),
                      labelText: "Nombre de Serie",
                      labelStyle: const TextStyle(color: Colors.white),
                    )),
                Column(
                  children: [
                    const Text("Serie 1",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Row(
                      children: [
                        const Text("Poid",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(width: 50),
                        const Text("Nombre de répétition",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
