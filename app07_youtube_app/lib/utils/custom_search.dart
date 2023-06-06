import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = [];

    if (query.isNotEmpty) {
      //this suggested list would be retrieved from an api
      list = ['Flutter', 'Beginners', 'Animation', 'Android', 'IOS']
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]),
            onTap: () {
              close(
                context,
                list[index].toLowerCase(),
              );
            },
          );
        },
      );
    }
    return const Center(
      child: Text('Nenhum resultado para a pesquisa'),
    );
  }
}