import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../provider.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  void initState() {
    Provider.of<MyProvider>(context, listen: false).getscience();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (ctx, value, child) => value.science.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItem(value.science[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
    );
  }
}