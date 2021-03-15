import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/Views/Cart.dart';
import 'package:food_delivery/Views/GetStarted.dart';
import 'package:food_delivery/Modal/FoodDataClass.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart'as http;

class FoodDataFetch extends StatefulWidget {
  @override
  _FoodDataFetchState createState() => _FoodDataFetchState();
}

class _FoodDataFetchState extends State<FoodDataFetch> {
  bool liked=false;

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
    return SafeArea(child: Scaffold(backgroundColor: Colors.white,
      body:GetStarted()
      ,));
  }
}

