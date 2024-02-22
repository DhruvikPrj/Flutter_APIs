import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDataList extends StatefulWidget {
  const UserDataList({super.key});

  @override
  State<UserDataList> createState() => _UserDataListState();
}

class _UserDataListState extends State<UserDataList> {
  var data;

  Future<void> getUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    //print(response.body);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReusableCard(
                          title: "Name", value: data[index]["name"].toString()),
                      ReusableCard(
                          title: "Email", value: data[index].email.toString()),
                      ReusableCard(
                          title: "Phone", value: data[index].phone.toString()),
                      ReusableCard(
                          title: "Adress",
                          value: data[index].address!.city.toString()),
                      ReusableCard(
                          title: "Geo",
                          value: data[index].address!.geo!.lat.toString()),
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
