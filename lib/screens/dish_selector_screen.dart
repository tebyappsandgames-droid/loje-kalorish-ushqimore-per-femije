import 'package:flutter/material.dart';
import 'make_dish_food_screen.dart';

class DishSelectorScreen extends StatelessWidget {
  const DishSelectorScreen({super.key});

  final List<String> plates = const [
    'assets/dishes/plate1.png',
    'assets/dishes/plate2.png',
    'assets/dishes/plate3.png',
    'assets/dishes/plate4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/selector_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Zgjidh Pjatën Tënde",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: plates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakeDishFoodScreen(selectedPlate: plates[index]),
                        ),
                      );
                    },
                    child: Hero(
                      tag: plates[index],
                      child: Image.asset(plates[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
