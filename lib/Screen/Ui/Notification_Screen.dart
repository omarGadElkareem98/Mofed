
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:panda_store/Constant/AppColor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Provider/UserProvider.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);



  @override



  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('notifications').tr()),
          backgroundColor: Colors.black,
        ),
        // drawer: Drawer(
        //   child: DrawerScreen(),
        // ),
        body: FutureBuilder(
          future:  SharedPreferences.getInstance(),

          builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(
                color: AppColor.AppColors,
              ));
            }
            if(snapshot!=null){
              List notifications = jsonDecode(snapshot.data!.getString('user')!)['notifications'];

              if(notifications.isEmpty){
                return Center(child: Text("Notifications is empty now"));
              }

              return ListView.builder(
                  itemCount: notifications.length ,
                  itemBuilder: (context , index)

                  {

                  return   ListTile(
                      title: Text('${notifications[index]['title']}'),
                    subtitle: Text('${notifications[index]['body']}'),
                    trailing:Text('${notifications[index]['date']}'),

                  );

                  });
            }
            return Text("");
          },
        )
    );
  }
}
