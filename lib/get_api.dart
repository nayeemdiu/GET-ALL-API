import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getapi/details_page.dart';
import 'package:getapi/get_post.dart';
import 'package:getapi/static_veriable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:getapi/api_service/User_api_service.dart';
import 'package:getapi/model/user_model.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  UserApiService userApiService = UserApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GetPost(),
                ));
              },
              child: Text(
                'Get Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: UserApiService().getUser(),
              builder: (context, snapshot) {
                //   print("data : ${snapshot}");

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 10,
                        margin: EdgeInsets.all(5),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            snapshot.data![index].name.toString(),
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          leading: Text(snapshot.data![index].id.toString()),
                          subtitle:
                              Text(snapshot.data![index].email.toString()),
                          trailing: Text(
                            snapshot.data![index].username.toString(),
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          /// Index click go to next page
                          onTap: (){
                          StaticVeriable.userModel = snapshot.data![index];
                          StaticVeriable.currentIndex =0;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(),));
                            
                          },
                        ),
                      );
                    },
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
