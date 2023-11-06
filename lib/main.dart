import 'package:flutter_svg/svg.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:plantyhomes/bottom_nav/configure.dart';
import 'package:plantyhomes/bottom_nav/discount.dart';
import 'package:plantyhomes/bottom_nav/settings.dart';
import 'package:plantyhomes/bottom_nav/shipping.dart';
import 'package:plantyhomes/category/ceramic_page.dart';
import 'package:plantyhomes/category/flower_page.dart';
import 'package:plantyhomes/category/fruits_page.dart';
import 'package:plantyhomes/category/green_plant.dart';
import 'package:plantyhomes/category/hanging_page.dart';
import 'package:plantyhomes/category/relgious.dart';
import 'package:plantyhomes/category/spices.dart';
import 'package:plantyhomes/category/vegetables_page.dart';
import 'package:plantyhomes/appbar/location.dart';
import 'package:plantyhomes/appbar/profile.dart';
import 'package:plantyhomes/model/categories_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plantyhomes/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => SplashScreen(), // SplashScreen as the initial route
        LocationScreen.routeName: (context) => LocationScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        '/flower': (context) => FlowerPage(),
        '/settings': (context) => SettingsPage(),
        '/shipping': (context) => ShippingPage(),
        '/configure': (context) => ConfigurePage(),
        '/discount': (context) => DiscountPage(),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BottomNavItem(
              svgScr: "assets/home.svg",
            ),
            BottomNavItem(
              svgScr: "assets/card.svg",
              onTap: () {
                Navigator.pushNamed(context, '/discount');
              },
            ),
            BottomNavItem(
              svgScr: "assets/hand.svg",
              onTap: () {
                Navigator.pushNamed(context, '/configure');
              },
            ),
            BottomNavItem(
              svgScr: "assets/shipping.svg",
              onTap: () {
                Navigator.pushNamed(context, '/shipping');
              },
            ),
            BottomNavItem(
              svgScr: "assets/settings1.svg",
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
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
              onSortSelected: (String) {},
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
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 140,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      'assets/gaurav.png',
                      'assets/nurs.jpg',
                      'assets/nursery-1.jpg',
                      'assets/nurs.jpg',
                    ].map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(item),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    }).toList(),
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
                const SizedBox(height: 10),
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
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 150,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.green.shade300,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 80,
                              child: Image.asset(
                                'assets/nurse.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 4, bottom: 2),
                                  child: Text(
                                    'Nursery 1',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.timer,
                                            size: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                          ),
                                        ),
                                        Text(
                                          '20 min',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.location_on,
                                            size: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                          ),
                                        ),
                                        Text(
                                          '3 km',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '₹450 (min.)',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //  ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
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
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LocationScreen.routeName);
                      },
                      child: Icon(
                        Icons.location_searching,
                        size: 20,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 400,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index < 3) {
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Row(children: [
                            Container(
                              height: 120,
                              width: 200,
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nursery 1',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.timer,
                                            size: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                          ),
                                          const Text(
                                            '20 min',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  128, 0, 0, 1.0),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: const Row(
                                              children: [
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 10.0,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 10.0,
                                            color:
                                                Color.fromRGBO(128, 0, 0, 1.0),
                                          ),
                                          Text(
                                            '3 km',
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  128, 0, 0, 1.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '₹450 (min)',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(128, 0, 0, 1.0),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
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
                            ),
                          ]),
                        );
                      } else {
                        return Container();
                      }
                    },
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

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final bool isActive;
  final void Function()? onTap;

  const BottomNavItem({
    super.key,
    required this.svgScr,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap function here
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
    padding: const EdgeInsets.all(10),
    shrinkWrap: true,
    crossAxisCount: 4,
    crossAxisSpacing: 2,
    mainAxisSpacing: 20,
    children: [
      SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlowerPage(),
              ),
            );
          },
          child: Column(
            children: [
              ClipOval(
                child: Neumorphic(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/flowers.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  'Flower',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
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
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/fruits.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VegetablesPage(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/vege.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CeramicPage(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/spices.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HangingPage(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/hanging.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpicesPage(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/spices.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RelgiousPage(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/sheaf-of-rice-svgrepo-com(1).svg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GreenPlant(),
            ),
          );
        },
        child: Column(
          children: [
            ClipOval(
              child: Neumorphic(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/nursery-1.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
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
          iconSize: 40,
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              'Pau Sector 35, Chandigarh',
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
            iconSize: 40,
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ),
      ),
    ],
  );
}

class CategorySelector extends StatelessWidget {
  final int selected;
  final List<String> categories;
  final Function(int) onTap;
  final Function(String) onSortSelected;

  CategorySelector({
    required this.selected,
    required this.categories,
    required this.onTap,
    required this.onSortSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < categories.length; i++)
            i == 0
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (i == selected) {
                            showSortMenu(context);
                          } else {
                            onTap(i);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                spreadRadius: 1,
                              ),
                            ],
                            color: selected == i ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                categories[i],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: selected == i
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      onTap(i);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 40,
                            spreadRadius: 3,
                          ),
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

  void showSortMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: "distance",
          child: Text("Sort by Distance"),
        ),
        const PopupMenuItem<String>(
          value: "price",
          child: Text("Sort by Price"),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        onSortSelected(value);
      }
    });
  }
}
