import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(RecipeApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const Page2(),
    ),
  ],
);

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: SvgPicture.asset(
              "assets/svg/vector.svg",
              width: 21,
              height: 14,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Color(0xFFFD5D69),
          ),
        ),
        actions: const [
          AppBarActionItem(
            image: "assets/svg/notification.svg",
            width: 12,
            height: 17,
          ),
          SizedBox(width: 5),
          AppBarActionItem(
            image: "assets/svg/search.svg",
            width: 14,
            height: 18,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF1C0F0D),
      ),
      body: const Column(
        children: [
          MainCategoryItem(image: "assets/seafood.png", text: "Seafood"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/lunch.png", text: "Lunch"),
              CategoryItem(image: "assets/breakfast.png", text: "Breakfast"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dinner.png", text: "Dinner"),
              CategoryItem(image: "assets/vegan.png", text: "Vegan"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dessert.png", text: "Dessert"),
              CategoryItem(image: "assets/drinks.png", text: "Drinks"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    required this.image,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.image, required this.text, Key? key})
      : super(key: key);

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            image,
            width: 159,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({required this.image, required this.text, Key? key})
      : super(key: key);

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            image,
            width: 356,
            height: 149,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 281,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFFD5D69),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/svg/home.svg"),
            onPressed: () => context.go('/'),
          ),
          IconButton(
              icon: SvgPicture.asset("assets/svg/community.svg"),
              onPressed: () => context.go('/page2'),
            
          ),
          SvgPicture.asset("assets/svg/categories.svg"),
          SvgPicture.asset("assets/svg/profile.svg"),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Text('Page 1'),
      ),
    );
  }
}
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: const Column(
        children: [
          CategoryItem(image: "assets/seafood.png", text: "Seafood"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/lunch.png", text: "Lunch"),
              CategoryItem(image: "assets/breakfast.png", text: "Breakfast"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dinner.png", text: "Dinner"),
              CategoryItem(image: "assets/vegan.png", text: "Vegan"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dessert.png", text: "Dessert"),
              CategoryItem(image: "assets/drinks.png", text: "Drinks"),
            ],
          ),
        ],
      ),
    );
  }
}
