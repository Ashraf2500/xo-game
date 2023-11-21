import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


class Question extends StatefulWidget {


   Question ({Key? key}) : super(key: key);



  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {





  int count = 15;
  late Timer timer ;



  AnswerQuestion_snackBar_false(){

    var snackBar = SnackBar(
      elevation: 0,
      //behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 2500),
      content: Container(

        height: (MediaQuery.of(context).size.height)*(15/100),
        padding: EdgeInsets.all(0),
        child: AwesomeSnackbarContent(
          //color: (turnWho=="X")? Colors.blue :  Colors.green,
          color: Colors.red[500],
          title: 'Fail ! ',
          message:'the time is over without pressing ',
          contentType: ContentType.failure,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  AnswerQuestion_snackBar_true(){

    var snackBar = SnackBar(
      elevation: 0,
      //behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 2500),
      content: Container(

        height: (MediaQuery.of(context).size.height)*(15/100),
        padding: EdgeInsets.all(0),
        child: AwesomeSnackbarContent(
          //color: (turnWho=="X")? Colors.blue :  Colors.green,
          color: Colors.orange[500],
          title: 'Success ',
          message:  ', you win a try delete ' ', you win a try delete ',
          contentType: ContentType.success,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }




  void start(){
    count = 15 ;
    timer =Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if(count > 0){
          count --;
        }else{

          timer.cancel();
          Navigator.pop(context);
          AnswerQuestion_snackBar_false();

        }
      });
    });
  }


@override
  void initState() {
    setState(() {
      start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("$count ",style:TextStyle(color:Colors.deepOrangeAccent,fontWeight:  FontWeight.bold,fontSize: 20));
  }

}
