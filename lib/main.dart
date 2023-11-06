import 'package:flutter_svg/svg.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:plantyhomes/category/ceramic_page.dart';
import 'package:plantyhomes/category/flower_page.dart';
import 'package:plantyhomes/category/fruits_page.dart';
import 'package:plantyhomes/category/green_plant.dart';
import 'package:plantyhomes/category/hanging_page.dart';
import 'package:plantyhomes/category/relgious.dart';
import 'package:plantyhomes/category/spices.dart';
import 'package:plantyhomes/category/vegetables_page.dart';
import 'package:plantyhomes/location/location.dart';
import 'package:plantyhomes/model/categories_model.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        LocationScreen.routeName: (context) => LocationScreen(),
        '/flower': (context) => FlowerPage(),
      },
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
  List<CategoriesModel> categories = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              svgScr: "assets/calendar.svg",
            ),
            BottomNavItem(
              svgScr: "assets/calendar.svg",
            ),
            BottomNavItem(
              svgScr: "assets/calendar.svg",
            ),
            BottomNavItem(
              svgScr: "assets/calendar.svg",
            ),
            BottomNavItem(
              svgScr: "assets/calendar.svg",
            ),
          ],
        ),
      ),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search_field(),
            const SizedBox(height: 20),
            CategorySelector(
              selected: selected,
              categories: const ['Sort', 'Gifts', 'Fast Delivery', 'Ceramic'],
              onTap: (index) {
                setState(() {
                  selected = index;
                });
              },
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "What's New",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/gaurav.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "What to plant today?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gridView(context),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Featured nurseries',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade500,
                              offset: const Offset(0.0, 2.0),
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/gaurav.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'Nursery 1',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '20 min',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '3 km',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                      Text(
                                        '₹450 (min.)',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nurseries around you',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 400,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Row(children: [
                            Container(
                              height: 120,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/nursery-1.jpg'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nursery 1',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '20 min',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  128, 0, 0, 1.0),
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.green,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '3 km',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                      Text(
                                        '₹450 (min)',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Flower, Ceramic, Vege..',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final bool isActive;
  final void Function()? press;

  const BottomNavItem({
    super.key,
    required this.svgScr,
    this.isActive = false,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgScr),
        ],
      ),
    );
  }
}

GridView gridView(BuildContext context) {
  return GridView.count(
    padding: const EdgeInsets.all(13),
    shrinkWrap: true,
    crossAxisCount: 4,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlowerPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/flowers.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Flower',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FruitsPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/bell-pepper-svgrepo-com.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Fruits',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VegetablesPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/cherry-svgrepo-com(1).svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Vegetables',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CeramicPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/corn-svgrepo-com.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Ceramic',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HangingPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/grapes-grape-svgrepo-com.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Hanging',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpicesPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/peach-svgrepo-com.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Spices',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RelgiousPage(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/sheaf-of-rice-svgrepo-com(1).svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Relgious',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GreenPlant(),
            ),
          );
        },
        child: ClipOval(
          child: Neumorphic(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/tomato-svgrepo-com.svg',
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Green Plant',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
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

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LocationScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        child: IconButton(
          iconSize: 55,
          icon: const Icon(Icons.location_on),
          onPressed: () {
            Navigator.pushNamed(context, LocationScreen.routeName);
          },
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
