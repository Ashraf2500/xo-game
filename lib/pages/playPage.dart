
import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:emoji_alert/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import 'package:xo/pages/question.dart';



import 'users.dart';
import 'snackBars/snackBars.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:select_dialog/select_dialog.dart';

import 'package:emoji_alert/emoji_alert.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';



class PlayPage extends StatefulWidget {
  //const PlayPage({Key? key}) : super(key: key);


  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {

  TextEditingController textControllerRand = TextEditingController();

  List<String> xoChoice = ["","","","","","","","","","","","","","","",""];

  bool X_firstPlayer = true;
  String lastWiner= "X";
  String? lastPlayer ;
  String turnWho = "O";

  
  int X_wins =0 ;
  int O_wins =0 ;
  int Draws =0 ;

  int tapX = 1;
  int tapY = 1;


  String? sendU1;
  String? sendU2;
  bool? sendT ;


  List <IconData> Icon_Bolt = [Icons.bolt,Icons.bolt,Icons.bolt,Icons.bolt,Icons.bolt,Icons.bolt];

  Color color_Icon_Bolt_X_On = Colors.blue;
  Color color_Icon_Bolt_O_On = Colors.green;
  Color color_Icon_Bolt_Off = Colors.grey;

  bool case_bolt_X_1 = true ;
  bool case_bolt_X_2 = true ;
  bool case_bolt_X_3 = true ;

  bool case_bolt_O_1 = true ;
  bool case_bolt_O_2 = true ;
  bool case_bolt_O_3 = true ;

  bool can_delete = false;

  bool deleted_Now_X = false;
  bool deleted_Now_O= false;



  int tries_over_X = 1 ;
  int tries_over_Y = 1 ;
  int  must_not_empty =1;
  int not_same_turn_X = 1 ;
  int not_same_turn_Y = 1 ;

  int not_same_turn_Q_X=1;
  int not_same_turn_Q_Y=1;
  int must_finish_first=1;




  bool canMakeQuestion = true;

  late int Rand1  ;
  late int Rand2  ;
  late int Rand3  ;

  int? resultInt ;
  String? result_Random ;

  String? onChangedTextField_Random ;







  void checkRand(int r1 , int r2 , int r3,String value){

           resultInt = r1  + r2  - r3 ;
           result_Random = resultInt.toString();


    if(value == result_Random && turnWho=="X" ){

        if(case_bolt_X_1==false && case_bolt_X_2==false && case_bolt_X_3==false){
          case_bolt_X_1 = true ;
          AnswerQuestion_snackBar_true();
        }


    }

    else if(value == result_Random && turnWho=="O"){
        if (case_bolt_O_1==false && case_bolt_O_2==false && case_bolt_O_3==false){
        case_bolt_O_1 = true ;
        AnswerQuestion_snackBar_true();
        //Navigator.pop(context);
      }
    }

    else if(value != result_Random && turnWho=="X"){
      AnswerQuestion_snackBar_false();
    }
    else if(value != result_Random && turnWho=="O"){
      AnswerQuestion_snackBar_false();
    }





  }




  String? whoAsk ;



  bool Lighting = true;
  IconData iconLight =Icons.lightbulb;




  @override
  Widget build(BuildContext context) {
    Users receiveUsers =ModalRoute.of(context)?.settings.arguments as Users;
    String user1 = receiveUsers.name1;
    String user2 = receiveUsers.name2;
    bool type = receiveUsers.type;



    void sendUsersToDialog(u1,u2){
      setState(() {
        sendU1 = u1;
        sendU2=  u2;
      });
    }

    void sendTypeToLogiC(T){
          sendT = T;

    }


    final double widthScreen  = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

     double widthContainerTop = (widthScreen/4.8);
     double heightContainerTop = (widthContainerTop/1);
     double Width_Between_Container_Top = widthScreen/15;

     double sizeBeforExpended = 2.8*(heightScreen/100);
     double sizeAfterTurn = 10 *(heightScreen/100);


     final double sizeIconBolt = 22;




    checkNameAsk(){
      setState(() {

          if(turnWho == "X"){
            whoAsk = user1;
          }else{
            whoAsk = user2;
          }
      });
    }





      return Scaffold(

      backgroundColor: Colors.white,
      body: Stack(

        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:  BoxDecoration(


              gradient: (turnWho=="O" && Lighting)? LinearGradient(
                  begin: Alignment.topRight,
                  end   : Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(242, 255, 230, 1),

                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Color.fromRGBO(242, 255, 230, 1),
                    Color.fromRGBO(220, 255, 204, 1),
                   // Color.fromRGBO(168, 255, 128 , 1),

                    //Colors.white,

                  ]

              )
                  :
                        (turnWho=="X" && Lighting)? LinearGradient(
                  begin: Alignment.topRight,
                  end   : Alignment.bottomLeft,
                  colors: [

                    Color.fromRGBO(230, 249, 255, 1),
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Color.fromRGBO(230, 249, 255, 1),
                    Color.fromRGBO(204, 243, 255, 1),
                   // Color.fromRGBO(128, 225, 255 , 1),

                    //Colors.white,

                  ]

              )
                  :
                        LinearGradient(
                            begin: Alignment.topRight,
                            end   : Alignment.bottomLeft,
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]

                        ),

            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 55,bottom: 30 ,left: 20 ,right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Icon(Icon_Bolt[0],color: (case_bolt_X_1)?color_Icon_Bolt_X_On:color_Icon_Bolt_Off,size: sizeIconBolt,),
                        Icon(Icon_Bolt[1],color: (case_bolt_X_2)?color_Icon_Bolt_X_On:color_Icon_Bolt_Off,size: sizeIconBolt,),
                        Icon(Icon_Bolt[2],color: (case_bolt_X_3)?color_Icon_Bolt_X_On:color_Icon_Bolt_Off,size: sizeIconBolt,),

                        SizedBox(height:30,),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: widthContainerTop,
                          height: heightContainerTop,
                          decoration: BoxDecoration(
                           // border: Border.all(color: (X_wins>O_wins)?Colors.orange:Colors.grey,width:(X_wins>O_wins)?2:1.6,),
                            border: Border.all(color:Colors.grey,width: 1.6,),
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap:(){
                                setState(() {
                                  if(tapX==1)
                                  {
                                    tapX=2;
                                  }else if (tapX ==2)
                                  {
                                    tapX=1;
                                  }
                                });

                              },
                              onLongPress: (){
                                setState(() {
                                  if(tapX==3)
                                  {
                                    tapX=1;
                                  }else
                                  {
                                    tapX=3;
                                  }
                                });
                              },
                              child: tapX==1 ? Text("X", style: TextStyle(color: Colors.blue,fontSize: 32,fontWeight: FontWeight.bold,),) :(tapX==2)?
                              Text("$user1", style: TextStyle(color: Color.fromRGBO(0, 89, 179, 1),fontSize: 12,fontWeight: FontWeight.w700),):
                              Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Text("X", style: TextStyle(color: Colors.blue,fontSize: 32,fontWeight: FontWeight.bold,),),
                                  Text("$user1", style: TextStyle(color: Color.fromRGBO(0, 89, 179, 1),fontSize: 12,fontWeight: FontWeight.w500),),
                                ],
                              ),


                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("$X_wins Wins",style: TextStyle(fontWeight: FontWeight.bold,color: (X_wins>=O_wins && X_wins>=Draws  &&!(X_wins==Draws && Draws==O_wins   && X_wins==0  ) )?Colors.orange:Colors.black,),),
                      ],
                    ),
                    SizedBox(width: Width_Between_Container_Top,),
                    Column(
                      children: [
                        Container(
                          width: widthContainerTop,
                          height: heightContainerTop,
                          decoration: BoxDecoration(
                            //border: Border.all(color: (X_wins==O_wins)?Colors.orange:Colors.grey,width:(X_wins==O_wins)?2:1.6,),
                            border: Border.all(color:Colors.grey,width: 1.6,),

                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(
                            child: Text("=",style: TextStyle(color: Colors.grey[600],fontSize: 35,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("$Draws Draw",style: TextStyle(fontWeight: FontWeight.bold,color: (Draws>=X_wins && Draws>=O_wins &&!(X_wins==Draws && Draws==O_wins   && X_wins==0 ) )?Colors.orange:Colors.black,),),

                      ],
                    ),
                    SizedBox(width: Width_Between_Container_Top,),
                    Column(
                      children: [
                        Container(
                          width: widthContainerTop,
                          height: heightContainerTop,
                          decoration: BoxDecoration(
                            //border: Border.all(color: (X_wins<O_wins)?Colors.orange:Colors.grey,width:(X_wins>O_wins)?2:1.6,),
                            border: Border.all(color:Colors.grey,width: 1.6,),
                            borderRadius: BorderRadius.all(Radius.circular(10)),


                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap:(){
                                setState(() {
                                  if(tapY==1)
                                  {
                                    tapY=2;
                                  }else if (tapY ==2)
                                  {
                                    tapY=1;
                                  }
                                });

                              },
                              onLongPress: (){
                                setState(() {
                                  if(tapY==3)
                                  {
                                    tapY=1;
                                  }else
                                  {
                                    tapY=3;
                                  }
                                });
                              },
                              child: tapY==1 ? Text("O", style: TextStyle(color: Colors.green,fontSize: 32,fontWeight: FontWeight.bold,),) :(tapY==2)?
                              Text("$user2", style: TextStyle(color: Color.fromRGBO(0, 102, 34, 1),fontSize: 12,fontWeight: FontWeight.w700),):
                              Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Text("O", style: TextStyle(color: Colors.green,fontSize: 32,fontWeight: FontWeight.bold,),),
                                  Text("$user2", style: TextStyle(color: Color.fromRGBO(0, 102, 34, 1),fontSize: 12,fontWeight: FontWeight.w500),),
                                ],
                              ),


                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("$O_wins Wins",style: TextStyle(fontWeight: FontWeight.bold,color: (O_wins>=X_wins && O_wins>=Draws  &&!(X_wins==Draws && Draws==O_wins && X_wins==0) )?Colors.orange:Colors.black,),),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icon_Bolt[3],color: (case_bolt_O_1)?color_Icon_Bolt_O_On:color_Icon_Bolt_Off,size: sizeIconBolt,),
                        Icon(Icon_Bolt[4],color: (case_bolt_O_2)?color_Icon_Bolt_O_On:color_Icon_Bolt_Off,size: sizeIconBolt,),
                        Icon(Icon_Bolt[5],color: (case_bolt_O_3)?color_Icon_Bolt_O_On:color_Icon_Bolt_Off,size: sizeIconBolt,),
                        SizedBox(height:30,),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: sizeBeforExpended,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.bolt,
                        size: 25,
                        color:(can_delete && turnWho=="X")?Colors.blue :
                        (can_delete && turnWho=="O")?Colors.green :
                        Color.fromRGBO(38, 38, 38,0.8),),
                      onPressed: (){
                        setState(() {

                          check_Icon_Bolt();
                        });

                      },

                    ),
                    IconButton(
                      icon: Icon(Icons.menu_book_outlined,size: 20,color:Color.fromRGBO(38, 38, 38,0.8) ,),
                      onPressed: (){
                        setState(() {


                          checkNameAsk();
                           Rand1  = (Random().nextInt(40)+10);
                           Rand2  = (Random().nextInt(40)+10);
                           Rand3  = (Random().nextInt(20)+10);


                          textControllerRand.clear();

                             if( turnWho=="X"  &&  case_bolt_X_1 == false  &&  case_bolt_X_2 ==false  &&  case_bolt_X_3==false  && canMakeQuestion){
                               showQuestion_dialog();

                               }
                             else if( turnWho=="O"  &&  case_bolt_O_1 == false  &&  case_bolt_O_2 ==false  &&  case_bolt_O_3==false && canMakeQuestion){
                               showQuestion_dialog();

                             }


                             else if(turnWho=="X"  &&  case_bolt_X_1 == false  &&  case_bolt_X_2 ==false  &&  case_bolt_X_3==false  && canMakeQuestion==false && not_same_turn_Q_X==1){
                               SnackBar snackBar = SnackBar(
                                 duration: Duration(milliseconds:1500),
                                 margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
                                 padding: EdgeInsets.all(0),
                                 behavior: SnackBarBehavior.floating,

                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(20))
                                 ),

                                 content: Container(
                                     height: MediaQuery.of(context).size.height*(7/100),
                                     decoration: BoxDecoration(
                                       border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                                       borderRadius: BorderRadius.all(Radius.circular(20)),
                                     ),
                                     child: Center(
                                       child:
                                       Text("$sendU1 ,you can't use it twice in the same turn",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                     )
                                 ),
                                 backgroundColor: Color.fromRGBO(38, 38, 38, 1),

                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }


                             else if( turnWho=="O"  &&  case_bolt_O_1 == false  &&  case_bolt_O_2 ==false  &&  case_bolt_O_3==false && canMakeQuestion==false && not_same_turn_Q_Y==1){
                               SnackBar snackBar = SnackBar(
                                 duration: Duration(milliseconds: 1500),
                                 margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
                                 padding: EdgeInsets.all(0),
                                 behavior: SnackBarBehavior.floating,

                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(20))
                                 ),

                                 content: Container(
                                     height: MediaQuery.of(context).size.height*(7/100),
                                     decoration: BoxDecoration(
                                       border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                                       borderRadius: BorderRadius.all(Radius.circular(20)),
                                     ),
                                     child: Center(
                                       child:
                                       Text("$sendU2 ,you can't use it twice in the same turn",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                                     )
                                 ),
                                 backgroundColor: Color.fromRGBO(38, 38, 38, 1),

                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }



                              else if  ( must_finish_first==1){
                               SnackBar snackBar = SnackBar(
                                 duration: Duration(milliseconds:1500),
                                 margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
                                 padding: EdgeInsets.all(0),
                                 behavior: SnackBarBehavior.floating,

                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(20))
                                 ),

                                 content: Container(
                                     height: MediaQuery.of(context).size.height*(7/100),
                                     decoration: BoxDecoration(
                                       border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                                       borderRadius: BorderRadius.all(Radius.circular(20)),
                                     ),
                                     child: Center(
                                         child:
                                         (turnWho == "X")? Text("$sendU1 , you must finish your tries first  ",style:TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.center,):
                                                           Text("$sendU2 , you must finish your tries first  ",style:TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                     )
                                 ),
                                 backgroundColor: Color.fromRGBO(38, 38, 38, 1),

                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);


                             }



                      //===============================================================================
                             if(not_same_turn_Q_X == 2){
                                not_same_turn_Q_X=1;
                             }
                              else{
                                not_same_turn_Q_X ++;
                            }
                         //-------------------------------

                          if(not_same_turn_Q_Y == 2){
                            not_same_turn_Q_Y=1;
                          }
                          else{
                            not_same_turn_Q_Y ++;
                          }
                          //-------------------------------

                          if(must_finish_first == 2){
                            must_finish_first=1;
                          }
                          else{
                            must_finish_first ++;
                          }
                          //-------------------------------



                        });

                      },
                    ),


                  ],
                ),


                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20 ,right: 20,top: 2),
                    child: GridView.builder(
                      itemCount: (type)? 9 : 16,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (type)? 3 : 4,

                      ),
                      itemBuilder:(BuildContext context , index){
                        return GestureDetector(
                          onTap: (){
                            _onTapGrid(index,can_delete);
                            sendUsersToDialog(user1, user2);
                            sendTypeToLogiC(type);

                          },
                          child: Container(
                            child: Center(child: Text(xoChoice[index],style: TextStyle(color: (xoChoice[index] =="X") ? Colors.blue:Colors.green,fontSize: 30,fontWeight: FontWeight.bold)),),
                            decoration: BoxDecoration(
                              border: (type)? Border(
                                left: (index==1 || index==2 || index==4 || index==5 || index==7 || index==8 ) ? BorderSide(color: Colors.grey,width: 3):BorderSide(color: Colors.white),
                                top : (index==3 || index==4 || index==5 || index==6 || index==7 || index==8 ) ? BorderSide(color: Colors.grey,width: 3):BorderSide(color: Colors.white),

                              ) :
                                              Border(
                                left: (index==1 || index==2 || index==3 || index==5 || index==6 || index==7 || index==9 || index==10 || index==11 || index==13 || index==14 || index==15 ) ?
                                BorderSide(color: Colors.grey,width: 3):BorderSide(color: Colors.white),
                                top : (index==4 || index==5 || index==6 || index==7 || index==8 || index==9 ||  index==10 || index==11 ||index==12 ||  index==13 || index==14 || index==15 ) ?
                                BorderSide(color: Colors.grey,width: 3):
                                BorderSide(color: Colors.white),

                              ),
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Turn  :   " , style: TextStyle(color: (turnWho =="X") ? Colors.blue:Colors.green,fontSize: 14,fontWeight: FontWeight.bold)),

                   // Text(" $turnWho ", style: TextStyle(color: (turnWho =="X") ? Colors.blue:Colors.green,fontSize: 20,fontWeight: FontWeight.bold)),

                    (turnWho=="X")?Text("$user1",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),):
                    Text("$user2",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: sizeAfterTurn,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.refresh,size: 40,color: Color.fromRGBO(38, 38, 38,0.9),),
                        onPressed: (){
                          remov_all();
                          X_wins=0;
                          O_wins=0;
                          Draws=0;
                          setState(() {

                          });
                        },
                      ),
                      Transform.translate(
                        offset: Offset(0,10),
                        child: IconButton(
                            icon: Icon(iconLight,size: 20,color: Color.fromRGBO(38, 38, 38,0.8),),
                            onPressed: (){
                              print("can delete   >>>>>>>$can_delete");
                              print("delete x now >>>>>>>$deleted_Now_X");
                              print("--------------------");

                              setState(() {
                                Lighting = ! Lighting;
                                if(Lighting)
                                  {
                                    iconLight =Icons.lightbulb;
                                  }else{
                                    iconLight =Icons.lightbulb_outline;
                                }

                              });
                            },

                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.home,size: 40,color: Color.fromRGBO(38, 38, 38,0.9),),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: sizeEnd,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapGrid(index , bool can) {

    if(can_delete && xoChoice[index]!=""){
      setState(() {
        if(turnWho != xoChoice[index]){
          xoChoice[index]="";
          can_delete =false;
        }else{

          SnackBar snackBar = SnackBar(
            duration: Duration(milliseconds:1500),
            margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
            padding: EdgeInsets.all(0),
            behavior: SnackBarBehavior.floating,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),

            content: Container(
                height: MediaQuery.of(context).size.height*(7/100),
                decoration: BoxDecoration(
                  border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: (turnWho=="X") ? Text("$sendU1 , you can't delete your box  ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,):
                           Text("$sendU2 , you can't delete your box  ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                )
            ),
            backgroundColor: Color.fromRGBO(38, 38, 38, 1),

          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });
    }
    else if(can_delete && xoChoice[index] == ""){
      setState(() {
          SnackBar snackBar = SnackBar(
            duration: Duration(milliseconds:1500),
            margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
            padding: EdgeInsets.all(0),
            behavior: SnackBarBehavior.floating,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),

            content: Container(
                height: MediaQuery.of(context).size.height*(7/100),
                decoration: BoxDecoration(
                  border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: (turnWho=="X") ? Text("$sendU1 , select box your enemy to delete it ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,):
                  Text("$sendU2 , select box your enemy to delete it ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                )
            ),
            backgroundColor: Color.fromRGBO(38, 38, 38, 1),

          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

      });
    }


    else if(can_delete==false &&  xoChoice[index]==""  ){
      setState(() {
        canMakeQuestion = true;

      if(X_firstPlayer ) {
          xoChoice[index]="X";
          turnWho="O";
          lastPlayer= "X";
          X_firstPlayer =! X_firstPlayer;

          deleted_Now_O = false;
        }
      else if(X_firstPlayer==false ) {
        xoChoice[index]="O";
        turnWho="X";
        lastPlayer= "O";
        X_firstPlayer =! X_firstPlayer;

        deleted_Now_X = false;
      };

      if(sendT==true) {
          _CheckWinenr1();
        }else{
        _CheckWinenr2();
      }


    });

    }
    else if(can_delete==false &&  xoChoice[index]!=""  ){
      setState(() {

        SnackBar snackBar = SnackBar(
          duration: Duration(milliseconds:1500),
          margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          content: Container(
              height: MediaQuery.of(context).size.height*(7/100),
              decoration: BoxDecoration(
                border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: (turnWho=="X") ? Text("$sendU1 , select empty box ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,):
                Text("$sendU2 , select empty box  ",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              )
          ),
          backgroundColor: Color.fromRGBO(38, 38, 38, 1),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      });

    }

  }

  void _CheckWinenr1() {

    //Check Row 1
    if(  xoChoice[0] == xoChoice[1] &&
         xoChoice[0] == xoChoice[2] &&
         xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    }); }

    //Check Row 2
    else if(  xoChoice[3] == xoChoice[4] &&
         xoChoice[3] == xoChoice[5] &&
         xoChoice[3] != "")
    {  showWhoWin_dialog(xoChoice[3]); setState(() {  lastWiner=xoChoice[3];    });   }

    //Check Row 3
    else if(  xoChoice[6] == xoChoice[7] &&
         xoChoice[6] == xoChoice[8] &&
         xoChoice[6] != "")
    {  showWhoWin_dialog(xoChoice[6]); setState(() {  lastWiner=xoChoice[6];    });   }



    //-----------------------------------------
    //Check Column 1
    else if( xoChoice[0] == xoChoice[3] &&
        xoChoice[0] == xoChoice[6] &&
        xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    });   }

    //Check Column 2
    else if( xoChoice[1] == xoChoice[4] &&
        xoChoice[1] == xoChoice[7] &&
        xoChoice[1] != "")
    {  showWhoWin_dialog(xoChoice[1]); setState(() {  lastWiner=xoChoice[1];    });   }

    //Check Column 3
    else if(  xoChoice[2] == xoChoice[5] &&
         xoChoice[2] == xoChoice[8] &&
         xoChoice[2] != "")
    {  showWhoWin_dialog(xoChoice[2]); setState(() {  lastWiner=xoChoice[2];    });   }


    //-------------------------------------
    //Check Diagonal 1
    else if(  xoChoice[0] == xoChoice[4] &&
         xoChoice[0] == xoChoice[8] &&
         xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    });   }

    //Check Diagonal 2
    else if(  xoChoice[2] == xoChoice[4] &&
         xoChoice[2] == xoChoice[6] &&
         xoChoice[2] != "")
    {  showWhoWin_dialog(xoChoice[2]); setState(() {  lastWiner=xoChoice[2];    });   }


    else if(xoChoice[0]!="" &&xoChoice[1]!="" &&xoChoice[2]!="" &&xoChoice[3]!="" &&xoChoice[4]!="" &&xoChoice[5]!="" &&xoChoice[6]!="" &&xoChoice[7]!="" &&xoChoice[8]!="") {
        Draws++;
        remov_all();
      }




  }
  void _CheckWinenr2(){

    //Check Row 1
    if(  xoChoice[0] == xoChoice[1] &&
         xoChoice[0] == xoChoice[2] &&
         xoChoice[0] == xoChoice[3] &&
         xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    }); }

    //Check Row 2
    else if(  xoChoice[4] == xoChoice[5] &&
              xoChoice[4] == xoChoice[6] &&
              xoChoice[4] == xoChoice[7] &&
              xoChoice[4] != "")
    {  showWhoWin_dialog(xoChoice[4]); setState(() {  lastWiner=xoChoice[4];    });   }

    //Check Row 3
    else if(  xoChoice[8] == xoChoice[9] &&
              xoChoice[8] == xoChoice[10] &&
              xoChoice[8] == xoChoice[11] &&
              xoChoice[8] != "")
    {  showWhoWin_dialog(xoChoice[8]); setState(() {  lastWiner=xoChoice[8];    });   }

    //Check Row 4
    else if(  xoChoice[12] == xoChoice[13] &&
              xoChoice[12] == xoChoice[14] &&
              xoChoice[12] == xoChoice[15] &&
              xoChoice[12] != "")
    {  showWhoWin_dialog(xoChoice[12]); setState(() {  lastWiner=xoChoice[12];    });   }



    //-----------------------------------------
    //Check Column 1
    else if( xoChoice[0] == xoChoice[4] &&
             xoChoice[0] == xoChoice[8] &&
             xoChoice[0] == xoChoice[12] &&
             xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    });   }

    //Check Column 2
    else if( xoChoice[1] == xoChoice[5] &&
             xoChoice[1] == xoChoice[9] &&
             xoChoice[1] == xoChoice[13] &&
             xoChoice[1] != "")
    {  showWhoWin_dialog(xoChoice[1]); setState(() {  lastWiner=xoChoice[1];    });   }

    //Check Column 3
    else if(  xoChoice[2] == xoChoice[6] &&
              xoChoice[2] == xoChoice[10] &&
              xoChoice[2] == xoChoice[14] &&
              xoChoice[2] != "")
    {  showWhoWin_dialog(xoChoice[2]); setState(() {  lastWiner=xoChoice[2];    });   }

    //Check Column 4
    else if(  xoChoice[3] == xoChoice[7] &&
              xoChoice[3] == xoChoice[11] &&
              xoChoice[3] == xoChoice[15] &&
              xoChoice[3] != "")
    {  showWhoWin_dialog(xoChoice[3]); setState(() {  lastWiner=xoChoice[3];    });   }

    //-------------------------------------
    //Check Diagonal 1
    else if(  xoChoice[0] == xoChoice[5] &&
              xoChoice[0] == xoChoice[10] &&
              xoChoice[0] == xoChoice[15] &&
              xoChoice[0] != "")
    {  showWhoWin_dialog(xoChoice[0]); setState(() {  lastWiner=xoChoice[0];    });   }

    //Check Diagonal 2
    else if(  xoChoice[3] == xoChoice[6] &&
              xoChoice[3] == xoChoice[9] &&
              xoChoice[3] == xoChoice[12] &&
              xoChoice[3] != "")
    {  showWhoWin_dialog(xoChoice[3]); setState(() {  lastWiner=xoChoice[3];    });   }

    else if(!xoChoice.contains(""))
      {
        Draws++;
        remov_all();
      }




  }


   showWhoWin_dialog(whiner){

    String? whoWin;
    if(whiner=="X")
      {
          X_wins++;
          whoWin = sendU1;




      }
    else{
      O_wins++;
      whoWin = sendU2;


    }

    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Congratulation !',
      desc: '$whoWin',
      titleTextStyle: TextStyle(color: Colors.green,fontSize: 23,fontWeight: FontWeight.w500),
      descTextStyle:TextStyle(color: (whoWin==sendU1)?Colors.blue :Colors.green ,fontSize: 20, fontWeight: FontWeight.w500),
     // btnOkColor:  (whoWin==sendU1)?Colors.blue :Colors.green ,

      btnOkOnPress: () {setState(() {
        remov_all();

        if(lastWiner=="X")
          {
            X_firstPlayer =true;
            turnWho="X";
          }else
            {
              X_firstPlayer=false;
              turnWho="O";
            }

      });},
    )..show();
  }

  showQuestion_dialog(){

    canMakeQuestion = false;
    EmojiAlert(
      alertTitle:  Text("$whoAsk , Can Answer ?", style:  TextStyle(fontWeight:  FontWeight.bold,fontSize: 14)),
      description:  Column(

        children: [
          //Text("$count ",style:TextStyle(color:Colors.deepOrangeAccent,fontWeight:  FontWeight.bold,fontSize: 20)),
          Question(),
          
          SizedBox(height: (MediaQuery.of(context).size.height)/35,),
          Text("$Rand1  +  $Rand2  -  $Rand3  = - - -  ",style:TextStyle(color:  (turnWho=="O")? Colors.green[800]:Colors.blue[800],fontWeight:  FontWeight.bold,fontSize: 16)),
          SizedBox(height: (MediaQuery.of(context).size.height)/40,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              autofocus:  true,
              maxLength: 4,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(

              ),
              controller: textControllerRand,
              onChanged: (value){
                setState(() {
                  onChangedTextField_Random = value;
                });
              },

            ),

          ),
          SizedBox(height: (MediaQuery.of(context).size.height)/14,),
          Text("must check",style: TextStyle(color:Colors.orange.shade600,fontWeight: FontWeight.w400,fontSize: 12 ),),


        ],
      ),

      enableMainButton:  true,
      mainButtonColor:  (turnWho=="X")?Colors.blue :Colors.green ,
      background:  (turnWho=="O")? Color.fromRGBO(234, 250, 234 , 1):Color.fromRGBO(230, 250, 255, 1),
      buttonSize: 200,
      cornerRadiusType: CORNER_RADIUS_TYPES.ALL_CORNERS,
      mainButtonText: Text("check"),
      emojiSize: 80,
      height:  (MediaQuery.of(context).size.height)/1.8,
      width: MediaQuery.of(context).size.width,


      //animationType: ANIMATION_TYPE.FADEIN,
      animationType: ANIMATION_TYPE.ROTATION,
      //animationType: ANIMATION_TYPE.TRANSITION,
      //animationType: ANIMATION_TYPE.NONE,

      onMainButtonPressed: () {
        Navigator.pop(context);
        checkRand(Rand1, Rand2, Rand3,onChangedTextField_Random!);



      },


      cancelable:  false,
      //emojiType:  EMOJI_TYPE.ANGRY,
      //emojiType:  EMOJI_TYPE.CONFUSED,
      //emojiType:  EMOJI_TYPE.COOL,
      emojiType:  EMOJI_TYPE.HAPPY,
      //emojiType:  EMOJI_TYPE.JOYFUL,
      //emojiType:  EMOJI_TYPE.LAUGHING,
      //emojiType:  EMOJI_TYPE.SAD,
      //emojiType:  EMOJI_TYPE.SCARED,
      //emojiType:  EMOJI_TYPE.SHOCKED,
      //emojiType:  EMOJI_TYPE.SMILE,
      //emojiType:  EMOJI_TYPE.WINK,

    ).displayAlert(context);

  }

  AnswerQuestion_snackBar_false(){

    var snackBar = SnackBar(
      elevation: 0,
      //behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds:1500),
      content: Container(

        height: (MediaQuery.of(context).size.height)*(15/100),
        padding: EdgeInsets.all(0),
        child: AwesomeSnackbarContent(
          //color: (turnWho=="X")? Colors.blue :  Colors.green,
          color: Colors.red[500],
          title: 'fail  ! ',
          message:'The correct answer is  $resultInt ',
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
      duration: Duration(milliseconds:1500),
      content: Container(

        height: (MediaQuery.of(context).size.height)*(15/100),
        padding: EdgeInsets.all(0),
        child: AwesomeSnackbarContent(
          //color: (turnWho=="X")? Colors.blue :  Colors.green,
          color: Colors.orange[500],
          title: 'Success  ',
          message: (turnWho=="X")? '$sendU1, you win a try delete ': '$sendU2, you win a try delete ',
          contentType: ContentType.success,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }



  remov_all( ){
    setState(() {
      for(int i = 0 ; i<16 ; i++ )
      {
        xoChoice[i]="";
      }
      turnWho="X";
      X_firstPlayer=true;


       case_bolt_X_1 = true ;
       case_bolt_X_2 = true ;
       case_bolt_X_3 = true ;

       case_bolt_O_1 = true ;
       case_bolt_O_2 = true ;
       case_bolt_O_3 = true ;

       can_delete = false;


    });

  }

  check_Icon_Bolt(){


    //============================================================================


      if(turnWho=="X"   && case_bolt_X_1==false   && tries_over_X==1  ) {

        SnackBar snackBar = SnackBar(
          duration: Duration(milliseconds: 1500),
          margin: EdgeInsets.only(left: 25 ,right: 25 ,bottom: 10),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          content: Container(
              height: MediaQuery.of(context).size.height*(7/100),
              decoration: BoxDecoration(
                border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: Text("$sendU1 , your tries are over ",style:TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              )
          ),
          backgroundColor: Color.fromRGBO(38, 38, 38, 1),


        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      else if(turnWho=="O"  && case_bolt_O_1==false   && tries_over_Y == 1 ){
        SnackBar snackBar = SnackBar(
          duration: Duration(milliseconds: 1500),
          margin: EdgeInsets.only(left: 25 ,right: 25 ,bottom: 15),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          content: Container(
              height: MediaQuery.of(context).size.height*(7/100),
              decoration: BoxDecoration(
                border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: Text("$sendU2 , your tries are over ",style:TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              )
          ),
          backgroundColor: Color.fromRGBO(38, 38, 38, 1),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }




      else if(!xoChoice.contains("X")  && !xoChoice.contains("O") && must_not_empty==1 ){

         SnackBar snackBar = SnackBar(
           duration: Duration(milliseconds: 1500),
           margin: EdgeInsets.only(left: 25 ,right: 25 ,bottom: 15),
           padding: EdgeInsets.all(0),
           behavior: SnackBarBehavior.floating,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(20))
           ),

           content: Container(
               height: MediaQuery.of(context).size.height*(7/100),
               decoration: BoxDecoration(
                 border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                 borderRadius: BorderRadius.all(Radius.circular(20)),
               ),
               child: Center(
                   child: Text("The boxes must not be empty  ",style:TextStyle(color:Colors.white,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
               )
           ),
           backgroundColor: Color.fromRGBO(38, 38, 38, 1),

         );
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }



      else if(turnWho =="X" && xoChoice.contains("O") && can_delete==false && deleted_Now_X==false ){
          deleted_Now_X =true;

          if(case_bolt_X_1 && case_bolt_X_2 && case_bolt_X_3){
            case_bolt_X_3 = false ;
            can_delete =true;

          }
          else if(case_bolt_X_1 && case_bolt_X_2 && case_bolt_X_3==false){
            case_bolt_X_2 = false ;
            can_delete =true;

          }
          else if(case_bolt_X_1 && case_bolt_X_2 == false && case_bolt_X_3 ==false){
            case_bolt_X_1 = false ;
            can_delete =true;

          }



      }

      else if( turnWho =="O" && xoChoice.contains("X") && can_delete==false && deleted_Now_O==false ){
        deleted_Now_O =true;

          if(case_bolt_O_1 && case_bolt_O_2 && case_bolt_O_3){
            case_bolt_O_3 = false ;
            can_delete =true;

          }
          else if(case_bolt_O_1 && case_bolt_O_2 && case_bolt_O_3==false){
            case_bolt_O_2 = false ;
            can_delete =true;

          }
          else if(case_bolt_O_1 && case_bolt_O_2 == false && case_bolt_O_3 ==false){
            case_bolt_O_1 = false ;
            can_delete =true;

          }

      }




      else if(turnWho=="X"  && deleted_Now_X == true && case_bolt_X_1  && not_same_turn_X==1 ){
        SnackBar snackBar = SnackBar(
          duration: Duration(milliseconds:1500),
          margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          content: Container(
              height: MediaQuery.of(context).size.height*(7/100),
              decoration: BoxDecoration(
                border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: Text("$sendU1 , you can't use it twice in the same turn",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              )
          ),
          backgroundColor: Color.fromRGBO(38, 38, 38, 1),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      else if(turnWho=="O"  && deleted_Now_O == true && case_bolt_O_1  && not_same_turn_Y==1  ){
        SnackBar snackBar = SnackBar(
          duration: Duration(milliseconds:1500),
          margin: EdgeInsets.only(left: 15 ,right: 15 ,bottom: 15),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          content: Container(
              height: MediaQuery.of(context).size.height*(7/100),
              decoration: BoxDecoration(
                border: Border.all(color:(turnWho=="X")?Colors.blue:Colors.green, width:1.5 ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: Text("$sendU2 ,you can't use it twice in the same turn",style:TextStyle(color:Colors.white,fontSize: 11,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              )
          ),
          backgroundColor: Color.fromRGBO(38, 38, 38, 1),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }




      //=======================================================================

      if(tries_over_X == 2){
          tries_over_X=1;
      }
      else{
          tries_over_X ++;
      }

      //----------------------------------
      if(tries_over_Y == 2){
          tries_over_Y=1;
      }
      else{
          tries_over_Y ++;
      }
      //----------------------------------
      if(must_not_empty == 2){
          must_not_empty=1;
      }
      else{
          must_not_empty ++;
      }
      //----------------------------------
      if(not_same_turn_X == 2){
          not_same_turn_X=1;
      }
      else{
          not_same_turn_X ++;
      }
      //----------------------------------
      if(not_same_turn_Y == 2){

          not_same_turn_Y=1;
      }
      else{
          not_same_turn_Y ++;
      }


  }





}




