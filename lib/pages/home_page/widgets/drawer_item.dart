import 'package:flutter/material.dart';

class Draweritem extends StatelessWidget {
  String title;
  IconData iconData;
  Function onClick;

  Draweritem({
    required this.title,
    required this.iconData,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style:const  TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
