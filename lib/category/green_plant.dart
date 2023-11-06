import 'package:flutter/material.dart';

class GreenPlant extends StatefulWidget {
  @override
  _GreenPlantState createState() => _GreenPlantState();
}

class _GreenPlantState extends State<GreenPlant> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Green Plant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/nurs.jpg',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 10),
            const Text(
              'Nursery ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //"Add to Bag" functionality here
                    setState(() {
                      itemCount++;
                    });
                  },
                  child: const Text('Add to Bag'),
                ),
                const SizedBox(width: 10),
                Text(
                  'Quantity: $itemCount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
