import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotos extends StatefulWidget {
  const GetPhotos({super.key});

  @override
  State<GetPhotos> createState() => _GetPhotosState();
}

class _GetPhotosState extends State<GetPhotos> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    print(response);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photo = Photos(
            title: i["title"], thumbnailUrl: i["thumbnailUrl"], url: i["url"]);
        photosList.add(photo);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 4, 2, 104),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          maxRadius: 20,
                          backgroundImage: NetworkImage(
                            snapshot.data![index].url.toString(),
                          ),
                        ),
                        title: Text(
                          snapshot.data![index].title.toString(),
                          maxLines: 1,
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    );
                  },
                );
              })),
    );
  }
}

class Photos {
  String title, thumbnailUrl, url;

  Photos({required this.title, required this.thumbnailUrl, required this.url});
}
