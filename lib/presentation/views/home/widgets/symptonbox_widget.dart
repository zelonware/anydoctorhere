import 'package:flutter/material.dart';

class SymptonBox extends StatelessWidget {
  const SymptonBox({
    super.key,
    required this.symptonIcon,
    required this.symptonName,
  });

  final String symptonIcon;
  final String symptonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(symptonIcon),
        SizedBox(
          width: 5,
        ),
        Text(symptonName)
      ],
    );
  }
}
