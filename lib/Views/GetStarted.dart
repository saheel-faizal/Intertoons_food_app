import 'package:flutter/material.dart';
import 'package:food_delivery/Views/HomePage.dart';
import 'package:food_delivery/Views/bottomnav_home.dart';
import 'package:get/route_manager.dart';


class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
        children: [
          Stack(alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),

              Container(height: 280,
                decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 50.0)),),),

              Positioned(top: 95,

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,),
                        height: 200,
                        width: MediaQuery.of(context).size.width *0.93,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: AssetImage("images/food.jpg"),fit: BoxFit.fill
                            )
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.10,),

                      Text('Quick delivery at \n your door',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30,letterSpacing: 0.7),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                      Text('Sometimes,the only way to describe food is to say \n '
                          'food was good tasting, or it tasted foul. . strictly\n '
                          ' used, refers to edible and pleasant food, or you\n'
                          '  could even write tasty, appetizing or delicious ',
                        textAlign: TextAlign.center,
                        maxLines: 3 ,
                        style: TextStyle(
                            height: 1.5,
                            color: Colors.grey,
                            letterSpacing: 0.5,
                            fontSize: 18),),
                      SizedBox(height: 16,),
                      Text("○ ○ ○",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Get.to(Bottom_nav_home());
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width *0.9,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.deepPurple[400]),
                          child: Center(child: Text("Get Started",
                            style: TextStyle(color: Colors.amber[600],
                                letterSpacing: 1,
                                fontSize: 15),)),
                        ),
                      ),



                    ],
                  ))

            ],
          ),
        ]
    ),);
  }
}
