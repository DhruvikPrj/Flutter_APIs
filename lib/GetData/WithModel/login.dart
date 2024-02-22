// import 'dart:convert';

// import 'package:api2/Models/joke_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class LoginApp extends StatelessWidget {

//   Future<List<Jokes>> getJoke() async {
//     final response = await http
//         .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

//     var data = jsonDecode(response.body.toString());
//     print(response.body);
//     if (response.statusCode == 200) {
//       for (Map<String, dynamic> i in data) {
//       }
//       return data;
//     } else {
//       return data;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: FutureBuilder(
//                   future: getJoke(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else {
//                       return ListView.builder(
//                         itemCount: Jokes.fromJson(Map),
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: const EdgeInsets.all(30),
//                             height: 100,
//                             width: 200,
//                             decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 6, 4, 143),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: ListTile(
//                               leading: Text(
//                                 data[index].type.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                               title: Text(
//                                 joke[index].setup.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                               subtitle: Text(
//                                 joke[index].punchline.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 10),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
