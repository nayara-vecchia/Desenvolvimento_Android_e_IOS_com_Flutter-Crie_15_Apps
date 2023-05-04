import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // print('pesquisa efetuada');
    // TODO: implement buildResults
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // print('resultado digitado $query');
    List<String> list = [];

    if (query.isNotEmpty) {
      //essa lista de sugeridos seria recuperada de uma api
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
    return Center(
      child: Text('Nenhum resultado para a pesquisa'),
    );
    // else {
    //   return Center(
    //     child: Text('Nenhum resultado para a pesquisa'),
    //   );
    // }
  }
}
