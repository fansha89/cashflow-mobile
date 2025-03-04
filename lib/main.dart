import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MenuPage(category: 'All'),
    MenuPage(category: 'Combos'),
    MenuPage(category: 'Sliders'),
    MenuPage(category: 'Classics'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CashFlow'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryTab(title: 'All'),
                CategoryTab(title: 'Combos'),
                CategoryTab(title: 'Sliders'),
                CategoryTab(title: 'Classics'),
              ],
            ),
          ),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  const CategoryTab({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Logic to change category can be added here
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String category;
  const MenuPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [..._getMenuItems()]));
  }

  List<Widget> _getMenuItems() {
    List<Widget> items = [];

    // Customize the items based on the selected category
    if (category == 'All') {
      items.add(MenuItem(name: 'Cheeseburger', rating: 4.9));
      items.add(MenuItem(name: 'Hamburger', rating: 4.8));
      items.add(MenuItem(name: 'Chicken Burger', rating: 4.7));
    } else if (category == 'Combos') {
      items.add(MenuItem(name: 'Combo Meal 1', rating: 4.6));
      items.add(MenuItem(name: 'Combo Meal 2', rating: 4.5));
    } else if (category == 'Sliders') {
      items.add(MenuItem(name: 'Mini Slider 1', rating: 4.3));
      items.add(MenuItem(name: 'Mini Slider 2', rating: 4.4));
    } else if (category == 'Classics') {
      items.add(MenuItem(name: 'Classic Burger', rating: 4.8));
      items.add(MenuItem(name: 'Classic Chicken', rating: 4.7));
    }

    return items;
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final double rating;

  const MenuItem({required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(Icons.fastfood, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 16),
            SizedBox(width: 5),
            Text(rating.toString()),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ),
    );
  }
}
