import 'package:flutter/material.dart';

import 'placeholder.dart' as model;

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AspectRatio(aspectRatio: 1 / 1, child: model.Placeholder()),
              const SizedBox(
                height: 10,
              ),
              ...List<Widget>.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index != 3 ? 4 : 0),
                  child: model.Placeholder(
                      width: double.maxFinite, borderRadius: 16, child: child),
                );
              })
            ],
          ); //.shimmer();
        });
  }
}
