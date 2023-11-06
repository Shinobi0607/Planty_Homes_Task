import 'package:flutter/material.dart';

class SpicesPage extends StatefulWidget {
  @override
  _SpicesPageState createState() => _SpicesPageState();
}

class _SpicesPageState extends State<SpicesPage> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spices Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/black_pepper.jpg',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              'Black Pepper ',
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
