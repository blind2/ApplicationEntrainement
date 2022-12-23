// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_generator/screens/edit_screen.dart';
import 'package:workout_generator/widgets/dropdown_item.dart';
import 'package:workout_generator/services/exercice_service.dart';

import '../models/user_progress.dart';

class UserProgressScreen extends StatefulWidget {
  const UserProgressScreen({Key? key, required this.exerciceId})
      : super(key: key);

  final int exerciceId;

  @override
  State<UserProgressScreen> createState() {
    return _UserProgressScreenState();
  }
}

class _UserProgressScreenState extends State<UserProgressScreen> {
  late ExerciceService exerciceService = ExerciceService();
  final dateController = TextEditingController();
  final weightController = TextEditingController();
  final repetitionController = TextEditingController();

  final dropDown = DropdownItem();

  List<UserProgressModel> _userProgress = [];
  _refreshUserProgress() async {
    final data = await exerciceService.getUserProgress(widget.exerciceId);
    setState(() {
      _userProgress = data;
    });
  }

  @override
  void initState() {
    super.initState();
    exerciceService = ExerciceService();
    exerciceService.init().whenComplete(() async {
      await _refreshUserProgress();
      setState(() {});
    });
  }

  @override
  void dispose() {
    dateController.dispose();
    weightController.dispose();
    repetitionController.dispose();
    super.dispose();
  }

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
                          exerciceService.addUserProgress(UserProgressModel(
                              date: dateController.text,
                              weight:
                                  "${weightController.text} ${dropDown.selectedValue}",
                              repetition: "${repetitionController.text} rep",
                              exerciceId: widget.exerciceId));
                          _refreshUserProgress();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 44, 44, 44),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20)),
                        child: const Text("Ajouter",
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
                                itemCount: _userProgress.length,
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
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                    _userProgress[index]
                                                        .date
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const Spacer(),
                                                Text(
                                                    _userProgress[index].weight,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const Spacer(),
                                                Text(
                                                    _userProgress[index]
                                                        .repetition
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                                const Spacer(),
                                                InkWell(
                                                  child: const Icon(Icons.edit),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditScreen(
                                                                userProgressId:
                                                                    _userProgress[index]
                                                                            .id ??
                                                                        0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  child:
                                                      const Icon(Icons.delete),
                                                  onTap: () {
                                                    exerciceService
                                                        .deleteUserProgress(
                                                            _userProgress[index]
                                                                    .id ??
                                                                0);
                                                    _refreshUserProgress();
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                              ])));
                                })))),
              ],
            ),
          ),
        ));
  }
}
