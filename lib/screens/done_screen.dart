import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  final String selectedPlate;
  final List<String> foodOnPlate;

  const DoneScreen({
    super.key, 
    required this.selectedPlate, 
    required this.foodOnPlate
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ju bëftë mirë!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(selectedPlate, width: 250),
                ...foodOnPlate.map((f) => Image.asset(f, width: 80)).toList(),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              child: const Text("Luaj Përsëri"),
            )
          ],
        ),
      ),
    );
  }
}
