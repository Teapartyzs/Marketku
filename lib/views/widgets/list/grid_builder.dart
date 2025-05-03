import 'package:flutter/material.dart';

class GridBuilder<T> extends StatelessWidget {
  const GridBuilder(
      {super.key,
      required this.data,
      required this.onBuild,
      required this.onTapAction,
      required this.isScroolDirection});

  final List<T> data;
  final Function(T) onTapAction;
  final Widget Function(T) onBuild;
  final bool isScroolDirection;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: isScroolDirection ? Axis.vertical : Axis.horizontal,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTapAction(data[index]);
            },
            child: onBuild(data[index]),
          );
        });
  }
}
