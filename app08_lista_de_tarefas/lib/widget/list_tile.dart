import 'package:flutter/material.dart';

class ListTileW extends StatefulWidget {
  const ListTileW({super.key, required this.listText});

  final String listText;

  @override
  State<ListTileW> createState() => _ListTileWState();
}

class _ListTileWState extends State<ListTileW> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.listText),
      value: isSelected,
      onChanged: (newValue) {
        setState(() {
          isSelected == newValue;
        });
      },
    );
  }
}
