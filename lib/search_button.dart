import 'package:flutter/material.dart';
import 'api_service.dart';

class SearchButton extends StatelessWidget {
  final TextEditingController controller;
  final void Function(Map<String, dynamic>) onSearchPressed;

  const SearchButton({super.key, 
    required this.controller,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final String username = controller.text;
          final result = await ApiService.fetchUserRepos(username);
          onSearchPressed(result);
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(e.toString()),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      },
      child: const Text('Search'),
    );
  }
}

