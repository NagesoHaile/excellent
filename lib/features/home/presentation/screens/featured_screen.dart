import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/color.dart';
import '../../../models/category.dart';
import '../widgets/category_card.dart';
import '../widgets/circle_button.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'X',
              style: TextStyle(
                  color: Color(0xffff6600),
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'excellent',
              style: TextStyle(
                color: Color(0xffff6600),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            // Appbar(),
            Body(),
            Body(),
            Body(),
          ],
        ),
      )),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        height: 200.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          gradient: LinearGradient(colors: [
            Color(0xFF795548),
            Color(0xFF3E2723),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          //color: Colors.green,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,\nGood Morning ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //CircleButton(icon: Icons.menu_rounded, onPressed: () {}),

                // SearchTextField(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Categories',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 24.0,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categoryList[index],
              );
            })
      ],
    );
  }
}
