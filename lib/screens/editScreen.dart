import 'package:flutter/material.dart';

// Define a custom Form widget.
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() {
    return _EditScreen();
  }
}

class _EditScreen extends State<EditScreen> {
  //final scoreService = ScoreService();

  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          title: const Text(
            'Modifier',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        ),
        backgroundColor: Colors.white,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/gym.jpg"), fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15),
                        const Text("Titre :",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(height: 5),
                        TextFormField(
                          // controller: playerNameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 151, 153, 154),
                            filled: true,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Description :",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 10,
                          maxLines: null,

                          // controller: scoreController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 151, 153, 154),
                            filled: true,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 53, 53, 53),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(fontSize: 20)),
                          child: const Text(
                            'Modifier',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    )))));
  }
}
