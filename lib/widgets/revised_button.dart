import 'package:flutter/material.dart';

class RevisedButton extends StatelessWidget {
  final String descButton;
  final Function press;
  final Color color, textColor;
  final double buttonSize;
  const RevisedButton({
    Key key,
    this.descButton,
    this.press,
    this.color,
    this.textColor,
    this.buttonSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(4, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(10, 13, 10, 0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: press,
        child: Container(
          width: buttonSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                descButton,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
