import 'package:flutter/material.dart';
import 'package:getapi/model/user_model.dart';
import 'package:getapi/static_veriable.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(StaticVeriable.userModel!.name.toString()),automaticallyImplyLeading: true,centerTitle: true,),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: ListTile(
            title: Text(StaticVeriable.userModel!.username.toString()),
            subtitle: Text(StaticVeriable.userModel!.website.toString()),
            trailing: Text(StaticVeriable.userModel!.phone.toString()),
          ),
        ),
      ),
    );
  }
}

