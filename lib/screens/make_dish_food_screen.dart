import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'scan_calories_screen.dart';
import 'done_screen.dart';

class MakeDishFoodScreen extends StatefulWidget {
  final String selectedPlate;
  const MakeDishFoodScreen({super.key, required this.selectedPlate});

  @override
  State<MakeDishFoodScreen> createState() => _MakeDishFoodScreenState();
}

class _MakeDishFoodScreenState extends State<MakeDishFoodScreen> {
  List<String> foodOnPlate = [];
  
  final List<Map<String, String>> foods = [
    {'img': 'assets/foods/rice.png', 'name': 'Oriz'},
    {'img': 'assets/foods/spaghetti.png', 'name': 'Spageti'},
    {'img': 'assets/foods/broccoli.png', 'name': 'Brokoli'},
    {'img': 'assets/foods/tomato.png', 'name': 'Domate'},
    {'img': 'assets/foods/fried_chicken.png', 'name': 'Pulë'},
    {'img': 'assets/foods/beef.png', 'name': 'Mish Lope'},
  ];

  void addFood(String foodImg) {
    if (foodOnPlate.length < 5) {
      setState(() {
        foodOnPlate.add(foodImg);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/kitchen_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Pjata dhe Ushqimet
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(widget.selectedPlate, width: 300),
                  ...foodOnPlate.asMap().entries.map((entry) {
                    return TranslationAnimatedWidget(
                      enabled: true,
                      values: const [Offset(0, -200), Offset(0, 0)],
                      child: Image.asset(entry.value, width: 100),
                    );
                  }).toList(),
                ],
              ),
            ),
            // Menuja e ushqimeve (poshtë)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                color: Colors.black26,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => addFood(foods[index]['img']!),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(foods[index]['img']!, width: 80),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Butonat e veprimeve
            Positioned(
              top: 40,
              right: 20,
              child: Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/buttons/scan_calories_button.png', width: 60),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScanCaloriesScreen())),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    icon: Image.asset('assets/buttons/done_button.png', width: 60),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DoneScreen(selectedPlate: widget.selectedPlate, foodOnPlate: foodOnPlate))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
