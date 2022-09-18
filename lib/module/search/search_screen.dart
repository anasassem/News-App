import 'package:firebase/components/components.dart';
import 'package:firebase/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (BuildContext context, val, Widget? child) {
        var list = val.search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: val.isDark?Colors.white:Colors.black),
                  decoration:  const InputDecoration(
                      hintText: "Search",
                      label: Text("Search"),
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                  ),
                  controller: searchController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "search must not me empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    val.getSearch(value);
                  },
                ),
              ),
              Expanded(child: articlebuilder(list, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
