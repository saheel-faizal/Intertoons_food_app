import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/Modal/FoodDataClass.dart';
import 'package:food_delivery/Views/Cart.dart';
import 'package:food_delivery/Views/HomePage.dart';
import 'package:food_delivery/Views/My%20Profile.dart';
import 'package:food_delivery/Views/Search.dart';
import 'bottom_bar.dart';
//import 'package:eva_icons_flutter/eva_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class Bottom_nav_home extends StatefulWidget {
  @override
  _Bottom_nav_homeState createState() => _Bottom_nav_homeState();
}
enum BottomIcons { Home, Search, Cart, Account }
class _Bottom_nav_homeState extends State<Bottom_nav_home> {
  BottomIcons bottomIcons = BottomIcons.Home;

  Future<FoodDataClass>getdata() async{
    String url="http://fda.intertoons.com/api/V1/products";

    Map data = {
      "currentpage":1,
      "pagesize":100,
      "sortorder": {
        "field":"menu_name",
        "direction":"desc"
      },
      "searchstring":"",
      "filter":{
        "category":""
      }
    };

    var dataenc = json.encode(data);

    var response=await http.post(url,headers: {"Authorization" : "Bearer akhil@intertoons.com"},body: dataenc);
    if(response.statusCode==200){
      return FoodDataClass.fromJson(jsonDecode(response.body));
      print("response found");
    }else{
      print('no data');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:Stack(
        children: <Widget>[
           bottomIcons == BottomIcons.Home
              ? HomePage()
          :bottomIcons == BottomIcons.Search
             ? SearchPage()

              : Container(),
          bottomIcons == BottomIcons.Cart
              ? Cart()

              : Container(),
          bottomIcons == BottomIcons.Account
              ? MyProfile()
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 6,),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),),color: Colors.white,),

                padding: EdgeInsets.only(left: 24, right: 24, bottom: 20,top: 5
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BottomBar(
                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Home;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                          icons: EvaIcons.homeOutline,
                          ),
                      BottomBar(
                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Search;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Search ? true : false,
                          icons: EvaIcons.search,
                          ),
                      BottomBar(
                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Cart;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Cart ? true : false,
                          icons: EvaIcons.shoppingCart,
                          ),
                      BottomBar(

                          onPressed: () {
                            setState(() {
                              bottomIcons = BottomIcons.Account;
                            });
                          },
                          bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                          icons: EvaIcons.personOutline,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
