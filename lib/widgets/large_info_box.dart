import 'package:flutter/material.dart';

class LargeInfoBox extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onTap;
  final double width;
  final double height;

  LargeInfoBox({
    required Key key,
    required this.title,
    required this.child,
    required this.onTap,
    this.width = double.infinity,
    this.height = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
