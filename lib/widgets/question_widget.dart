import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;

  const QuestionWidget({
    Key key,
    this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.7,
      ),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: Color.fromARGB(255, 55, 60, 77),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Text(
        questionText,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
