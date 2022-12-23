import 'package:flutter/material.dart';
import 'package:workout_generator/services/exercice_service.dart';
import 'package:workout_generator/widgets/dropdown_item.dart';

import '../models/user_progress.dart';

// Define a custom Form widget.
class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.userProgressId});

  final int userProgressId;

  @override
  State<EditScreen> createState() {
    return _EditScreen();
  }
}

class _EditScreen extends State<EditScreen> {
  late ExerciceService exerciceService = ExerciceService();

  final dateController = TextEditingController();
  final weightController = TextEditingController();
  final repetitionController = TextEditingController();

  var dropDown = DropdownItem();

  @override
  void dispose() {
    weightController.dispose();
    dateController.dispose();
    repetitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          centerTitle: true,
          title: const Text(
            'Modifier',
            style: TextStyle(color: Colors.grey, fontSize: 20),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(children: [
                Flexible(
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Poid",
                          labelStyle: TextStyle(color: Colors.white),
                        ))),
                const SizedBox(width: 30),
                dropDown,
              ]),
              TextField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  controller: repetitionController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Répétition",
                    labelStyle: const TextStyle(color: Colors.white),
                  )),
              TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: dateController,
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
                    if (pickedDate != null) {
                      String YYYY_MM_DD =
                          pickedDate.toIso8601String().split('T').first;
                      dateController.text = YYYY_MM_DD;
                    }
                  }),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        exerciceService.updateUserProgress(
                            widget.userProgressId,
                            UserProgressModel(
                              date: dateController.text,
                              weight:
                                  "${weightController.text} ${dropDown.selectedValue}",
                              repetition: "${repetitionController.text} rep",
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 44, 44, 44),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: const TextStyle(fontSize: 20)),
                      child: const Text("Modifier",
                          style: TextStyle(color: Colors.grey, fontSize: 25))),
                  const Spacer()
                ],
              ),
            ])));
  }
}
