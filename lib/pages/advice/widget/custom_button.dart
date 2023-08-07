import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () {},
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              color: themeData.colorScheme.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.displayLarge,
            ),
          ),
        ),
      ),
    );
  }
}
