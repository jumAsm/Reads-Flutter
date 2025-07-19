import 'package:flutter/material.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/widget/header_lib.dart';
import 'package:reads/widget/reads_list_view.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String currentSearchText = '';
  String selectedFilter = 'All';

  void _updateSearch(String value) {
    setState(() {
      currentSearchText = value;
    });
  }

  void _updateFilter(String value) {
    setState(() {
      selectedFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backWhite,
      body: SafeArea(
        child: Column(
          children: [
            HeaderLib(
              onSearchChanged: _updateSearch,
              onFilterChanged: _updateFilter,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Readslistview(
                searchQuery: currentSearchText,
                selectedFilter: selectedFilter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
