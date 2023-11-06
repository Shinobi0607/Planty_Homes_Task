import 'package:flutter/material.dart';

class HangingPage extends StatefulWidget {
  @override
  _HangingPageState createState() => _HangingPageState();
}

class _HangingPageState extends State<HangingPage> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hanging Tree Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hang.jpg',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kokomada ',
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
