// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pagination_test/extensions/scroll_controller_extensions.dart';
import 'widgets/placeholder.dart' as model;

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int?> items = List.filled(25, null, growable: true);

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.paginate(callback: addItems);
  }

  void addItems() {
    print("ADD MORE ITEMS");

    setState(() {
      items.addAll(List.filled(5, null));
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(16)),
              child: Text("Item: ${index + 1}"),
            );
          },
        ),
      ),
    );
  }
}
