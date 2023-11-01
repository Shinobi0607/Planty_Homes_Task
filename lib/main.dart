import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          search_field(),
          const SizedBox(height: 20),
          CategorySelector(
            selected: selected,
            categories: const ['Sort', 'Gifts', 'Fast Delivery', 'Ceremic'],
            onTap: (index) {
              setState(() {
                selected = index;
              });
            },
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const Text(
                "What's New",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/gaurav.png'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container search_field() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            hintText: 'Try searching a nursery or a plant',
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.normal),
            prefixIcon: IconButton(
              iconSize: 30,
              color: Colors.green,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              iconSize: 30,
              color: Colors.green,
              icon: const Icon(Icons.mic),
              onPressed: () {},
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 5),
          child: IconButton(
            iconSize: 55,
            icon: const Icon(Icons.location_on),
            onPressed: () {},
            color: Colors.green,
          ),
        ),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                'Bangalore',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              iconSize: 55,
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
    required this.selected,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  final int selected;
  final List<String> categories;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        children: [
          for (int i = 0; i < categories.length; i++)
            GestureDetector(
              onTap: () {
                onTap(i);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 40,
                      spreadRadius: 3,
                    )
                  ],
                  color: selected == i ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    categories[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: selected == i ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
