import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/Modal/FoodDataClass.dart';
import 'package:food_delivery/Views/ProductDetails.dart';
import 'package:http/http.dart' as http;
import 'package:get/route_manager.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final key=GlobalKey<FormState>();
  TextEditingController searchcontroller= new TextEditingController();

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
    return SafeArea(child: Scaffold(backgroundColor: Colors.blueGrey[50],
        body: ListView(
          shrinkWrap: true,
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

                  // Container(
                  //     height: MediaQuery.of(context).size.height,
                  //     width: MediaQuery.of(context).size.width,
                  //     color: Colors.transparent),

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
                  // SizedBox(height: ,),

                ],
              ),
              SizedBox(height: 25,),
              Container(margin: EdgeInsets.only(left: 10,bottom: 5),
                  child: Text('5 Results Found',style: TextStyle(fontSize: 20,color: Colors.grey[700]),)),
              FutureBuilder(future: getdata(),
                  builder: (context,snapshot){
                if(snapshot.hasData){
                  List<Product> arr=snapshot.data.data.products;
                  return GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: arr.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1/1.3
                      ),
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(ProductDetails(image: arr[index].image,
                              name: arr[index].name.toString(),
                              price: arr[index].price.toString(),
                              sku: arr[index].sku.toString(),
                              id: arr[index].id,
                              description: arr[index].description.toString(),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 150,
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(image: arr[index].image!=null?NetworkImage(arr[index].image.toString()):AssetImage('images/Pizza.jpg'),fit: BoxFit.fill)
                                    ),),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(arr[index].name.toString(),overflow:TextOverflow.ellipsis,style: TextStyle(letterSpacing: 0.2,fontSize: 17)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(arr[index].description.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(letterSpacing: 0.8,fontSize: 15)),
                                  ),
                                  Container(height: 40,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(arr[index].price.toString(),style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                        ),

                                        IconButton(icon: Icon(Icons.arrow_forward_outlined,color: Colors.yellow,), onPressed: (){

                                          Get.to(ProductDetails(image: arr[index].image,
                                            name: arr[index].name.toString(),
                                            price: arr[index].price.toString(),
                                            sku: arr[index].sku.toString(),
                                            id: arr[index].id,
                                            description: arr[index].description.toString(),
                                          ));

                                        })
                                      ],),)
                                ],),
                            ),
                          ),
                        );

                      });

                }else{
                  return Center(child: Container(margin:EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator()));
                }


              }),


            ]),
    )
    );
  }
}
