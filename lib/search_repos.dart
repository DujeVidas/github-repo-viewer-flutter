import 'package:flutter/material.dart';

class SearchRepos extends StatelessWidget {
  final TextEditingController controller;

  const SearchRepos({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'GitHub Username',
        ),
      ),
    );
  }
}

