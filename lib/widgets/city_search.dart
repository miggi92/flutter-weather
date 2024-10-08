// widgets/city_search.dart

import 'package:flutter/material.dart';

class CitySearch extends StatelessWidget {
  const CitySearch({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: 'Stadt',
          border: OutlineInputBorder(),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
