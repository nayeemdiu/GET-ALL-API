import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:getapi/api_service/User_api_service.dart';

class GetPost extends StatefulWidget {
  const GetPost({Key? key}) : super(key: key);

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  UserApiService userApiService = UserApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(title: Text('Get Post'),
      centerTitle: true,),

     body: Column(
       children: [
         Expanded(
           child: FutureBuilder(
             future: UserApiService().getUser(),
             builder: (context, snapshot) {
               print(snapshot.toString());
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
                           snapshot.data![index].email.toString(),
                           style: TextStyle(
                               fontSize: 15.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.blue),
                         ),
                         leading: Text(snapshot.data![index].id.toString()),
                         subtitle:
                         Text(snapshot.data![index].address.toString()),
                         trailing: Text(
                           snapshot.data![index].id.toString(),
                           style: TextStyle(
                               fontSize: 15.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.blueGrey),
                         ),

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
