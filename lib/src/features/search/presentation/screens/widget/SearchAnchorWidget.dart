import 'package:flutter/material.dart';

class SearchAnchorWidget extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onFilterSelected;

  const SearchAnchorWidget({super.key, this.onChanged, this.onFilterSelected});

  @override
  _SearchAnchorWidgetState createState() => _SearchAnchorWidgetState();
}

class _SearchAnchorWidgetState extends State<SearchAnchorWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<String> _suggestions = [
    "Pizza",
    "Pasta",
    "Burger",
    "Salad",
    "Japanese"
  ];

  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = List.from(_suggestions);

    _searchController.addListener(() {
      final query = _searchController.text;
      _onSearchChanged(query);
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (widget.onChanged != null) {
      widget.onChanged!(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
          ),
          child: TextField(
            controller: _searchController,
            focusNode: _focusNode,
            textInputAction: TextInputAction.search,
            onSubmitted: (query) {
              _onSearchChanged(query);
              if (widget.onChanged != null) {
                widget.onChanged!(query);
              }
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Colors.black54),
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.filter_list, color: Colors.black),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onSelected: (value) {
                  if (widget.onFilterSelected != null) {
                    widget.onFilterSelected!(value);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                      value: "Countries", child: Text("Countries")),
                  const PopupMenuItem(
                      value: "Ingredients", child: Text("Ingredients")),
                  const PopupMenuItem(
                      value: "Categories", child: Text("Categories")),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),

        // Suggestions list
        if (_focusNode.hasFocus && _filteredSuggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredSuggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _filteredSuggestions[index];
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    _searchController.text = suggestion;
                    _onSearchChanged(suggestion);
                    _focusNode.unfocus();
                  },
                );
              },
            ),
          ),

        if (_focusNode.hasFocus && _filteredSuggestions.isEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
            ),
            child: const ListTile(
              title: Text("No suggestions found."),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
