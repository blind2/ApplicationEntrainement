// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_generator/widgets/dropdownItem.dart';

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
          centerTitle: true,
          title: const Text(
            'Progression',
            style: TextStyle(color: Colors.grey),
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: const [
                  Flexible(
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          //controller: dateController, //editing controller of this TextField
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Poid",
                            labelStyle: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(width: 30),
                  DropdownItem(),
                ]),
                const TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    //controller: dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Répétition",
                      labelStyle: const TextStyle(color: Colors.white),
                    )),
                TextField(
                    style: const TextStyle(color: Colors.white),
                    //controller: dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      labelText: "Date",
                      labelStyle: TextStyle(color: Colors.white),

                      //label text of field
                    ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                    }),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 44, 44, 44),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20)),
                        child: const Text("Ajouter",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 25))),
                    const SizedBox(width: 30),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 44, 44, 44),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20)),
                        child: const Text("Effacer",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 25))),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                    child: Expanded(
                        child: Scrollbar(
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: 4,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 5),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 151, 153, 154),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black,
                                              )),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                const SizedBox(width: 5),
                                                const Text("date",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const Spacer(),
                                                const Text("60 lbs",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const Spacer(),
                                                const Text(" 10 Rep",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const SizedBox(width: 20),
                                              ])));
                                })))),
              ],
            ),
          ),
        ));
  }
}
