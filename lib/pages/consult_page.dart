import 'package:desain_eelfeel/consultPages/advanced_consultation.dart';
import 'package:desain_eelfeel/consultPages/trouble_consultation.dart';
import 'package:desain_eelfeel/consultPages/visit_consultation.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:desain_eelfeel/widgets/option_button.dart';
import 'package:desain_eelfeel/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class ConsultPage extends StatefulWidget {
  final phStates,
      tempStates,
      heightStates,
      phVal,
      tempVal,
      heightVal,
      condStates;
  ConsultPage({
    Key key,
    this.phStates,
    this.tempStates,
    this.heightStates,
    this.phVal,
    this.tempVal,
    this.heightVal,
    this.condStates,
  }) : super(key: key);

  @override
  _ConsultPageState createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Konsultasi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => WelcomePage()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                QuestionWidget(
                    questionText:
                        'Hai, Ada yang bisa dibantu? Kami para pakar siap membantu anda!'),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                answerBuilder(),
              ],
            ), */
            chooseOption(),
          ],
        ),
      ),
    );
  }

  //Widget chatBody() {}

  // Widget chatBuilder() {}

  Widget messageBuilder() {
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
        'Hai, Ada yang bisa dibantu? Kami para pakar siap membantu anda!',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget answerBuilder() {
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
          bottomRight: Radius.circular(15),
        ),
        color: Colors.orange[400],
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Text(
        'Jawaban Testing',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget chooseOption() {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.cyan[50],
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 3), //(x,y)
                  blurRadius: 7.0,
                ),
              ],
            ),
            child: Text(
              'Pilih permasalahan anda.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              OptionButton(
                color: Colors.orange[300],
                textColor: Colors.black,
                descButton: 'Saya ingin konsultasi lanjutan',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdvancedConsultation(),
                    ),
                  );
                },
              ),
              OptionButton(
                color: Colors.orange[300],
                textColor: Colors.black,
                descButton: 'Terjadi pemasalahan di kolam saya',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TroubleConsultation(),
                    ),
                  );
                },
              ),
              OptionButton(
                color: Colors.orange[300],
                textColor: Colors.black,
                descButton: 'Saya butuh kehadiran pakar di kolam',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisitConsultation(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
