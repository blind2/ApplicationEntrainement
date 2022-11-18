import 'package:flutter/material.dart';
import 'package:workout_generator/models/note_model.dart';
import 'package:workout_generator/services/note_service.dart';

// Define a custom Form widget.
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() {
    return _AddNoteScreenState();
  }
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final noteService = NoteService();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          centerTitle: true,
          title: const Text(
            'Ajout',
            style: TextStyle(color: Colors.white, fontSize: 20),
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
                          style: const TextStyle(color: Colors.white),
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
                          onPressed: () {
                            final NoteModel noteModel = NoteModel(
                                date: DateTime.now().toString(),
                                title: titleController.text,
                                description: descriptionController.text);

                            noteService.addNote(noteModel);
                            print(noteModel.date);
                            print(noteModel.title);
                            print(noteModel.description);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 53, 53, 53),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(fontSize: 20)),
                          child: const Text(
                            'Ajouter',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    )))));
  }
}
