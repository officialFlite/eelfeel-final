import 'package:flutter/material.dart';

class DataWidgets extends StatelessWidget {
  final String variables;
  final IconData icon;

  const DataWidgets({
    Key key,
    this.variables,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            variables,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
