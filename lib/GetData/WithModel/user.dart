import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Models/userModel.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  List<UserModel> userDataList = [];

  Future<List<UserModel>> getUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    //print(response.body);
    if (response.statusCode == 200) {
      userDataList.clear();
      for (Map<String, dynamic> i in data) {
        userDataList.add(UserModel.fromJson(i));
      }
      return userDataList;
    } else {
      return userDataList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: getUser(),
      builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: userDataList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReusableCard(
                          title: "Name",
                          value: userDataList[index].name.toString()),
                      ReusableCard(
                          title: "Email",
                          value: userDataList[index].email.toString()),
                      ReusableCard(
                          title: "Phone",
                          value: userDataList[index].phone.toString()),
                      ReusableCard(
                          title: "Adress",
                          value: userDataList[index].address!.city.toString()),
                      ReusableCard(
                          title: "Geo",
                          value:
                              userDataList[index].address!.geo!.lat.toString()),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

//Custom Widget Builder
class ReusableCard extends StatelessWidget {
  final String title, value;

  ReusableCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
