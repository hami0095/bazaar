import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/themes_provider.dart';

class Badge extends StatelessWidget {
  final Widget? child;
  final String value;
  final Color color;
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child!,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // ignore: deprecated_member_use
              color: Provider.of<ThemesProvider>(context).themeMode ==
                      ThemeMode.light
                  ? Colors.black87
                  : Colors.white,
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
