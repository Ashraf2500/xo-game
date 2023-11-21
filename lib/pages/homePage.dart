


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:avatar_glow/avatar_glow.dart';

import 'users.dart';

import 'playPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textControllerX = TextEditingController();
  TextEditingController textControllerY = TextEditingController();

  ExactAssetImage thatWillAppear = ExactAssetImage('images/xo4.jpg');
  int picLogo = 1;

  bool showBorder = true;
  Color colorBorderImage= Color.fromRGBO(38, 38, 38,0.6) ;



  String userX="";
  String userY="";
  String userz ="3";

  bool Type =true;



  bool canNext = false;
  bool checkX = false;
  bool checkY = false;

  bool useDefault = false;





  Color colorLableUX =  Colors.grey.shade600;
  Color colorLableUY =  Colors.grey.shade600;

  bool showErorrText = false;

  Color colorRadio = Color.fromRGBO(119, 119, 60, 1) ;

  Color buttonSplashColor =  Color.fromRGBO(156, 156, 99, 1);



  String labelText_X= "player 1";
  String labelText_Y= "player 2";


   checkUserX(x) {

    setState(() {

      if( x!=null   && x!=""  ) {
        colorLableUX = Colors.grey.shade700;
        checkX = true;
      }
      else {
        colorLableUX = Colors.red.shade300;
        checkX = false;
      }

    });

  }

   checkUserY(y) {
    setState(() {

      if( y!=null   && y!=""  ) {
        colorLableUY = Colors.grey.shade700;
        checkY = true;
      }
      else {
        colorLableUY = Colors.red.shade300;
        checkY = false;
      }

    });

  }

  checkUser(x ,y) {
     setState(() {

       if(useDefault){
         canNext = true;
         showErorrText = false;
       }
       else{
         checkUserX(x);
         checkUserY(y);

         if(checkX&&checkY)
         {
           canNext = true;
           showErorrText = false;
         }
         else{
           canNext= false;
           showErorrText = true;
         }
       }


     });
  }
  
  
   startGame(bool Can_Next){
     if(Can_Next) {
       return Navigator.pushNamed(context, 'PlayPage',arguments:Users(name1: userX, name2: userY ,type: Type ));
     }
  }







  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double sizeBeforCircle = 5*(heightScreen/100);
    double sizeAfterCircle = 10*(heightScreen/100);
    double sizeBetweenTextfiled = 1.2*(heightScreen/100);
    double sizeBeforError = .5*(heightScreen/100);
    double sizeBetweenErrorAndRadio = 5*(heightScreen/100);
    double sizeBeforButton = 8*(heightScreen/100);
    double sizeReblaceErorr = 2.2*(heightScreen/100);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Stack(
          children: [

            Container(
              width: widthScreen,
              height: heightScreen,

              decoration: BoxDecoration(

                gradient:
                (thatWillAppear == ExactAssetImage('images/logo3.jpg') )  ?
                LinearGradient(
                    begin: Alignment.topRight,
                    end   : Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(255, 239, 204, 1),

                      Colors.white,
                      Colors.white,
                      //Colors.white,
                      Color.fromRGBO(255, 247, 230, 1),
                      //Color.fromRGBO(255, 239, 204, 1),
                      //Color.fromRGBO(255, 231, 179, 1),
                      Color.fromRGBO(255, 223, 153, 1),

                      //Colors.white,

                    ]

                ):
                (thatWillAppear == ExactAssetImage('images/xo11.jpg') )  ?
                LinearGradient(
                    begin: Alignment.topRight,
                    end   : Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(255, 214, 204, 1),
                     // Color.fromRGBO(255, 235, 230, 1),

                      Colors.white,
                      Colors.white,
                      //Colors.white,
                      Color.fromRGBO(255, 235, 230, 1),
                      Color.fromRGBO(255, 214, 204  , 1),
                      //Color.fromRGBO(255, 194, 179 , 1),

                      //Colors.white,

                    ]

                ):
                LinearGradient(
                    begin: Alignment.topRight,
                    end   : Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(225, 225, 208  , 1),

                      Colors.white,
                      Colors.white,
                      //Colors.white,
                      Color.fromRGBO(225, 225, 208, 1),
                      Color.fromRGBO(175, 175, 131, 1),

                      //Colors.white,

                    ]

                ),



              ),
            ),



            Column(
              children: [

                SizedBox(height: sizeBeforCircle,),


                Center(
                  child: AvatarGlow(
                    endRadius: 105.0,
                    // glowColor: Color.fromRGBO(255, 219, 77,1),
                    glowColor: Colors.grey,
                    duration: Duration(milliseconds: 2500),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: Duration(milliseconds: 50),
                    
                    child: Stack(
                      children: [
                        (showBorder)?Transform.translate(
                          offset: Offset(-1.5,-2),
                          child: Container(
                            height: 154,
                            width: 153,

                            decoration: BoxDecoration(
                              color: colorBorderImage,
                              borderRadius:BorderRadius.all(Radius.circular(100))
                            ),
                          ),
                        ):SizedBox(),

                        Material(     // Replace this child with your own
                          elevation: 15,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 75.0,
                            backgroundColor: Colors.white,
                            child: GestureDetector(
                              onDoubleTap: (){
                                setState(() {
                                  showBorder=!showBorder;
                                });
                              },
                              onLongPress:(){
                                setState(() {
                                  if(picLogo==1)
                                    {
                                      thatWillAppear = ExactAssetImage('images/xo4.jpg');
                                      colorBorderImage= Color.fromRGBO(205, 205, 177, 1);
                                      //colorBorderImage= Colors.white;
                                      buttonSplashColor = Color.fromRGBO(156, 156, 99, 1);
                                      colorRadio = Color.fromRGBO(119, 119, 60, 1);

                                    }
                                  else if(picLogo==2)
                                   {
                                     thatWillAppear = ExactAssetImage('images/logo3.jpg');
                                     colorBorderImage = Color.fromRGBO(38, 38, 38,0.6) ;
                                     buttonSplashColor = Colors.orange.shade700;
                                     colorRadio = Color.fromRGBO(255, 133, 51,0.9 );
                                   }
                                  else{
                                    thatWillAppear = ExactAssetImage('images/xo11.jpg');
                                    colorBorderImage= Colors.red.shade100;
                                    buttonSplashColor = Color.fromRGBO(255, 77, 77, 0.8);
                                    colorRadio = Color.fromRGBO(255, 71, 26, 1);

                                  }
                                });
                                picLogo ++;
                                if(picLogo>3)
                                  {
                                    picLogo=1;
                                  }
                              },


                              child: Container(

                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: thatWillAppear,

                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: sizeAfterCircle,),


                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child:  TextField(
                      //  autofocus: true,
                        //readOnly: (useDefault)?true:false,
                        enabled: (useDefault)?false:true,
                        maxLength: 7,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 61, 102, 1),                  // color: Color.fromRGBO(38, 38, 38,1),   //color: Color.fromRGBO(0, 115, 230 , 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "X player",
                          hintStyle: TextStyle(fontSize: 12,color: Colors.grey ),
                          labelText: labelText_X,
                          labelStyle: TextStyle(fontSize: (useDefault)?13:12,color: colorLableUX),

                          fillColor: Color.fromRGBO(230, 245, 255 , 0.6),
                          prefixIcon: Icon(Icons.person,color: colorLableUX,),



                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),


                        ),
                        controller: textControllerX,
                        onChanged: (value){
                          setState(() {
                            userX =value;
                            checkUserX(value);
                            showErorrText = false;
                          });
                        },
                        onSubmitted: (value){
                          setState(() {
                            userX =value;
                            checkUserX(value);
                          });
                        },




                      ),
                    ),

                    SizedBox(height: sizeBetweenTextfiled,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child:  TextField(
                        //autofocus: true,
                        //readOnly: (useDefault)? true:false,
                        enabled: (useDefault)?false:true,
                        maxLength: 7,
                        style: TextStyle(
                          //color: Color.fromRGBO(35, 144, 35 , 1),
                          color: Color.fromRGBO(0, 77, 26 , 1),
                          //color: Color.fromRGBO(38, 38, 38,1),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,

                        ),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "O player",
                          hintStyle: TextStyle(fontSize: 12,color: Colors.grey ),
                          labelText: labelText_Y,
                          labelStyle: TextStyle(fontSize: (useDefault)?13:12,color:colorLableUY),

                          // fillColor: Colors.white,
                          fillColor: Color.fromRGBO(235, 250, 235, 0.6),
                          prefixIcon: Icon(Icons.person,color:colorLableUY),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),

                          /* border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(23),
                              bottomLeft: Radius.circular(23),
                              bottomRight: Radius.circular(23),

                            ),
                          ),*/



                        ),
                        controller: textControllerY,
                        onChanged: (value){
                          setState(() {
                            userY =value;
                            checkUserY(value);
                            showErorrText = false;
                          });
                        },

                        onSubmitted: (value){
                          setState(() {
                            userY =value;
                            checkUserY(value);
                          });
                        },

                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(left: widthScreen*(13/100)),
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: (useDefault)?colorRadio:Color.fromRGBO(38, 38, 38,.7),
                          value: useDefault,
                          onChanged: (value){
                            setState(() {
                              useDefault = value!;
                              if(useDefault){
                                colorLableUX = Color.fromRGBO(0, 61, 102, 1);
                                colorLableUY = Color.fromRGBO(0, 77, 26 , 1);
                                textControllerX.clear();
                                textControllerY.clear();
                                labelText_X = "Player X";
                                labelText_Y = "Player O";
                                userX="Player X";
                                userY="Player O";

                              }else{
                                colorLableUX = Colors.grey.shade700;
                                colorLableUY = Colors.grey.shade700;
                                labelText_X = "player 1";
                                labelText_Y = "player 2";
                                userX="";
                                userY="";
                              }
                            });
                          }
                      ),
                      Text("Fill default",style: TextStyle(color: (useDefault)?colorRadio:Color.fromRGBO(38, 38, 38,.7),fontWeight:FontWeight.bold,fontSize:11    ),),
                    ],
                  ),
                ),

                SizedBox(height: sizeBeforError,),

                (showErorrText && useDefault==false)?Text(" Please enter both names  ! ",style: TextStyle(color:Colors.red.shade600,fontWeight: FontWeight.w400,fontSize: 13 ),) :SizedBox(height: sizeReblaceErorr,),

                SizedBox(height: sizeBetweenErrorAndRadio,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: true,
                      groupValue: Type,
                      activeColor: colorRadio,
                      splashRadius: 25,
                      onChanged: (bool? v){
                        setState(() {
                          Type = v!;
                        });
                      },
                    ),
                    Text("3x3",style: TextStyle(color: (Type)?colorRadio:Color.fromRGBO(38, 38, 38,.7),fontWeight:FontWeight.bold,fontSize:14    ),),

                    SizedBox(width:widthScreen*(32/100),),
                    Radio(
                      value: false,
                      groupValue: Type,
                      activeColor: colorRadio,
                      onChanged: (bool? v){
                        setState(() {
                          Type = v!;
                        });
                      },
                    ),
                    Text("4x4",style: TextStyle(color: (Type==false)?colorRadio:Color.fromRGBO(38, 38, 38,0.7),fontWeight:FontWeight.bold,fontSize:14    ),),
                  ],
                ),



                SizedBox(height: sizeBeforButton,),


                ElevatedButton(
                  child:  SizedBox(
                    child: Center(child: Text("Start Game",textAlign: TextAlign.center,style: (TextStyle(color: Color.fromRGBO(255, 247, 230, 1))),)),
                    width: 120,
                    height: 40,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(38, 38, 38,1)),
                    overlayColor: MaterialStateProperty.all(buttonSplashColor),
                    //surfaceTintColor: MaterialStateProperty.all(buttonSplashColor),

                    elevation: MaterialStateProperty.all(12),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                  ),



                  onPressed: (){

                    checkUser(userX,userY);
                   startGame(canNext);


                    },

                ),



              ],
            ),

          ],
        ),
      ),
    );



  }
}


