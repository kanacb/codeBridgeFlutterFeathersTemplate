import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget(
      {super.key, required this.label, this.value, required this.list , required this.onSelected});
  String? value;
  late final Function onSelected;
  final String label;
  final List<Map<String, dynamic>> list;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
        label: Text(
          widget.label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
        ),
        helperText: "",
        hintText: widget.label,
        width: MediaQuery.of(context).size.width - 35,
        initialSelection: widget.value,
        onSelected: (value) => widget.onSelected,
        dropdownMenuEntries: widget.list.map((e) {
          return DropdownMenuEntry<String>(
              label: e['label'],
              value: e['value'],
              enabled: e['enabled']);
        }).toList());
  }
}
