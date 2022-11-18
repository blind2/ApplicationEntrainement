import 'package:flutter/material.dart';
import 'package:workout_generator/screens/exerciceDetailScreen.dart';

class ExerciceScreen extends StatelessWidget {
  const ExerciceScreen({Key? key}) : super(key: key);

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
                          itemCount: 10,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciceDetailScreen(),
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
                                          const Text("Exercice",
                                              style: TextStyle(
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
