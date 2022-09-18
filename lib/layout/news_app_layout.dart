import 'package:firebase/components/components.dart';
import 'package:firebase/module/search/search_screen.dart';
import 'package:firebase/provider.dart';
import 'package:firebase/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (ctx, value, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false)
                    .changeThemeMode();
              },
              icon: const Icon(Icons.brightness_4),
            )
          ],
          title: const Text("اخبار اليوم"),
        ),
        body: value.Screens[value.currentindex],
        bottomNavigationBar: BottomNavigationBar(
          items: value.bottomItems,
          currentIndex: value.currentindex,
          onTap: (index) {
            value.changeBottomNavBar(index);
          },
        ),
      ),
    );
  }
}
