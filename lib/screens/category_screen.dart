import 'package:flutter/material.dart';
import 'package:workout_generator/models/categorie_model.dart';
import 'package:workout_generator/screens/exercice_screen.dart';
import 'package:workout_generator/services/exercice_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() {
    return _CategorieScreenState();
  }
}

class _CategorieScreenState extends State<CategoryScreen> {
  late ExerciceService exerciceService = ExerciceService();
  List<CategorieModel> _categories = [];

  _refreshCategorie() async {
    final data = await exerciceService.getCategorie();
    setState(() {
      _categories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    exerciceService = ExerciceService();
    exerciceService.init().whenComplete(() async {
      await _refreshCategorie();
      setState(() {});
    });
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ExerciceScreen(categorieId: _categories[index].categorieId),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          centerTitle: true,
          title: const Text(
            'Categorie',
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
                          itemCount: _categories.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context, _createRoute(index));
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
                                          Text(_categories[index].name,
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
