import 'package:flutter/material.dart';
import 'package:food_delivery/Views/Cart.dart';
import 'package:food_delivery/Views/My%20Profile.dart';
import 'package:food_delivery/Views/Search.dart';
import 'package:get/route_manager.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final key=GlobalKey<FormState>();
  TextEditingController searchcontroller= new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,

        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(color:Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListTile(tileColor: Colors.deepPurple,
                    leading: Icon(Icons.menu,color: Colors.white,),
                    title: Text('Food',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,letterSpacing: 1),),
                  trailing: Icon(Icons.height,size: 1,),),
                )),
            Stack(alignment: AlignmentDirectional.topStart,

              children: [

                Container(
                    height: MediaQuery.of(context).size.height*1.2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent),

                Container(height: 140,

                  decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 50.0)),),),

                Form(key: key,
                  child: Positioned(top: 20,

                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),
                              color: Colors.white,),

                            margin: EdgeInsets.symmetric(horizontal: 15,),
                            width: MediaQuery.of(context).size.width *0.93,
                            child: TextFormField(controller: searchcontroller,
                              decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                              suffixIcon: Icon(Icons.edit_road,color: Colors.yellow[800],)),

                            ),

                          ),
                        ],
                      )),
                ),
                SizedBox(height: 25,),
                Positioned(
                  left: 25,top: 155,
                    child: Text('Top Of The Day',style: TextStyle(letterSpacing: 0.8,fontSize: 18),)),

                Positioned(top: 200,left: 20,
                  child: Container(
                      height: MediaQuery.of(context).size.height *0.3 ,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Carousel(dotIncreaseSize: 1,
                        dotIncreasedColor: Colors.deepPurple,
                        showIndicator: false,
                        borderRadius: true,
                        images: [
                          AssetImage('images/food.jpg'),
                          AssetImage('images/Pizza.jpg'),
                          AssetImage('images/Broast.jpg')
                        ],
                      )
                  ),
                ),

                Positioned(
                    left: 25,top: 430,
                    child: Column(
                      children: [
                        Text('Select Your Choice',style: TextStyle(letterSpacing: 0.8,fontSize: 18),),
                        SizedBox(height: 20,),

                      ],
                    )),

                Positioned(top: 480,left: 10,
                    child: Container(height: 190,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height:100 ,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red,
                          image: DecorationImage(image: AssetImage('images/pizzza.jpg'),fit: BoxFit.fill)),),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width*0.04,),


                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height:100 ,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red,
                              image: DecorationImage(image: AssetImage('images/burg.jpeg'),fit: BoxFit.fill)),),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width*0.04,),

                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height:100 ,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red,
                              image: DecorationImage(image: AssetImage('images/pizzza.jpg'),fit: BoxFit.fill)),),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width*0.04,),

                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height:100 ,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red,
                              image: DecorationImage(image: AssetImage('images/burg.jpeg'),fit: BoxFit.fill)),),
                      ),





                    ],),
                ))


              ],
            ),
          ]
      ),),
    );
  }
}
