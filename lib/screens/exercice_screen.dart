import 'package:flutter/material.dart';
import 'package:workout_generator/models/categorie_model.dart';
import 'package:workout_generator/models/exercice_model.dart';
import 'package:workout_generator/models/user_progress.dart';
import 'package:workout_generator/screens/user_progress_screen.dart';

import '../services/exercice_service.dart';

class ExerciceScreen extends StatefulWidget {
  const ExerciceScreen({Key? key, required this.categorieId}) : super(key: key);
  final int categorieId;

  @override
  State<ExerciceScreen> createState() {
    return _ExerciceScreenState();
  }
}

class _ExerciceScreenState extends State<ExerciceScreen> {
  late ExerciceService exerciceService = ExerciceService();
  List<ExerciceModel> _exercices = [];

  _ExerciceScreenState();

  _refreshExercice() async {
    final data = await exerciceService.getExercice(widget.categorieId);
    setState(() {
      _exercices = data;
    });
  }

  @override
  void initState() {
    super.initState();
    exerciceService = ExerciceService();
    exerciceService.init().whenComplete(() async {
      await _refreshExercice();
      setState(() {});
    });
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
            'Exercices',
            style: TextStyle(color: Colors.grey, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gym.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Scrollbar(
                      child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          shrinkWrap: true,
                          itemCount: _exercices.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserProgressScreen(
                                          exerciceId:
                                              _exercices[index].id ?? 0),
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 75,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 151, 153, 154),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                        )),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          Text(_exercices[index].name,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20)),
                                          const Spacer(),
                                          Image.asset(
                                            "assets/right_arrow.png",
                                            height: 16,
                                            width: 16,
                                          ),
                                          const SizedBox(width: 20),
                                        ])));
                          })))
            ],
          ),
        ));
  }
}
