import 'package:flutter/material.dart';

class AppbarSearch extends StatelessWidget {
  const AppbarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: TextFormField(
        enabled: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary, fontSize: 18),
        decoration: const InputDecoration(
          hintText: 'Search...',
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
        onFieldSubmitted: (value) {},
      ),
    );
  }
}
