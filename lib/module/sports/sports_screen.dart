import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../provider.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  void initState() {
    Provider.of<MyProvider>(context, listen: false).getsports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (ctx, value, child) => value.sports.isEmpty
          ? const Center(child: Center(child: CircularProgressIndicator()))
          : ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItem(value.sports[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
    );
  }
}
