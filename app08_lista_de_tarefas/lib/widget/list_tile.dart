import 'package:flutter/material.dart';

class ListTileW extends StatefulWidget {
  ListTileW({super.key, required this.listText});

  String listText;

  @override
  State<ListTileW> createState() => _ListTileWState();
}

class _ListTileWState extends State<ListTileW> {
  late bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.listText),
      value: isSelected,
      onChanged: (newValue) {
        print(newValue);
        setState(() {
          isSelected == newValue;
        });
      },
    );
  }
}
