import 'package:flutter/material.dart';

class SearchAnchorWidget extends StatefulWidget {
  const SearchAnchorWidget({super.key});

  @override
  _SearchAnchorWidgetState createState() => _SearchAnchorWidgetState();
}

class _SearchAnchorWidgetState extends State<SearchAnchorWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = [
    "Pizza",
    "Pasta",
    "Burger",
    "Salad",
    "Steak"
  ];
  List<String> _filteredSuggestions = [];

  /*void _onSearchChanged(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              controller.openView();
              //_onSearchChanged(query);
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: Colors.black54),
              suffixIcon: PopupMenuButton<String>(
                icon: Icon(Icons.filter_list, color: Colors.black),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Countries", child: Text("Countries")),
                  PopupMenuItem(
                      value: "Ingredients", child: Text("Ingredients")),
                  PopupMenuItem(value: "Categories", child: Text("Categories")),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return _filteredSuggestions.map((suggestion) {
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              _searchController.text = suggestion;
              controller.closeView(suggestion);
            },
          );
        }).toList();
      },
    );
  }
}
