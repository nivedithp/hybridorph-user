import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  final TextEditingController? controller;
  final T? initialSelection;
  final Function(T? selected) onSelected;
  final String hintText;

  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  const CustomDropDownMenu({
    super.key,
    required this.hintText,
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.controller,
    this.initialSelection,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: initialSelection,
      onSelected: onSelected,
      controller: controller,
      width: double.infinity,
      hintText: hintText,
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
