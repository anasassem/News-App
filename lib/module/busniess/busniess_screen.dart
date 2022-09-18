import 'package:firebase/components/components.dart';
import 'package:firebase/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    Provider.of<MyProvider>(context, listen: false).getBusiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      var list = Provider.of<MyProvider>(context).business;
    return articlebuilder(list);
  }
}

//return const Center(child: CircularProgressIndicator());
