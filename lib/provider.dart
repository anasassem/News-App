import 'package:firebase/module/busniess/busniess_screen.dart';
import 'package:firebase/module/science/science_screen.dart';
import 'package:firebase/module/settings_screen/settings_screen.dart';
import 'package:firebase/module/sports/sports_screen.dart';
import 'package:firebase/remote/cache_helper.dart';
import 'package:firebase/remote/dio_helper.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool isDark = false;

 void changeThemeMode({bool? fromShared})
  {
  if (fromShared!=null) {
    isDark =fromShared;
    notifyListeners();
  } else {
    isDark = !isDark;

    CacheHelper.putDate(key: "isDark", value: isDark).then((value) {
      notifyListeners();
    });
  }
  }

  int currentindex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center_sharp), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),

  ];
  List<Widget> Screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(index) {
    currentindex = index;
    notifyListeners();
  }

  List<dynamic> business = [];

  Future<void> getBusiness() async {
    try {
      var data = await DioHelper.getDate(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "445b8f9da05141189f31adcf83a0c34f"
      });
      business = data.data["articles"];
      notifyListeners();
    } catch (error) {
      print('hhhhhhhhhhhh $error');
    }
  }
  List<dynamic> science = [];
  Future<void> getscience() async {
    try {
      var data = await DioHelper.getDate(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "445b8f9da05141189f31adcf83a0c34f"
      });
      science = data.data["articles"];
      notifyListeners();
    } catch (error) {
      print('hhhhhhhhhhhh $error');
    }
  }
  List<dynamic> sports = [];
  Future<void> getsports() async {
    try {
      var data = await DioHelper.getDate(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "445b8f9da05141189f31adcf83a0c34f"
      });
      sports = data.data["articles"];
      notifyListeners();
    } catch (error) {
      print('hhhhhhhhhhhh $error');
    }
  }

  List<dynamic> search = [];
 void getSearch(String value) async {
    try {
      var data = await DioHelper.getDate(url: "v2/everything", query: {
        "q": "$value",
        "apiKey": "445b8f9da05141189f31adcf83a0c34f"
      });
      search = data.data["articles"];
      notifyListeners();
    } catch (error) {
      print('hhhhhhhhhhhh $error');
    }
  }
}
