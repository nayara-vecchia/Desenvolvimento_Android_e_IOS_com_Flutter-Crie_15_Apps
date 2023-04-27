import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeOption extends StatelessWidget {
  const HomeOption(this.imageAsset, this.nameOfTheRoute, {super.key});
  final String imageAsset;
  final String nameOfTheRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(nameOfTheRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(imageAsset),
      ),
    );
  }
}
