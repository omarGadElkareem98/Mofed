
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:panda_store/Constant/AppColor.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override

  Future <String> getTerms () async {
    try{
      http.Response response = await http.get(Uri.parse("https://technicians.onrender.com/informations/terms"));
      return response.body;
    } catch(error){
      return "error";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(

          future: getTerms(),

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