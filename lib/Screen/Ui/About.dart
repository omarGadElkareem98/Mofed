

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constant/AppColor.dart';
import 'package:http/http.dart' as http;

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override

  Future <String> getAbout () async {
    try{
      http.Response response = await http.get(Uri.parse("https://technicians.onrender.com/informations/about"));
      return response.body;
    } catch(error){
      return "error";
    }
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(

         future: getAbout(),

        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
           if(snapshot.connectionState == ConnectionState.waiting){
             return Center(child: CircularProgressIndicator(
               color: AppColor.AppColors,
             ));
           }
           if(snapshot.data==null){
             return Center(
               child: Text('Data is null'),
             );
           }
           return Text("${snapshot.data}");
      } ,

      )
    );
  }
}
