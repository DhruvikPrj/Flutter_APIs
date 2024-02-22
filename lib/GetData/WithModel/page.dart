import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Models/customer_model.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Customers> customer = [];

  Future<List<Customers>> getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.1.67:3000/api/customers/"));

    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      customer.clear();
      for (Map<String, dynamic> i in data) {
        customer.add(Customers.fromJson(i));
      }
      return customer;
    } else {
      return customer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: customer.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(30),
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 6, 4, 143),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            leading: const Icon(
                              Icons.account_box_outlined,
                              color: Colors.white,
                            ),
                            title: Text(
                              customer[index].name.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            subtitle: Text(
                              customer[index].email.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            trailing: Text(
                              customer[index].phone.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


//ElevatedButton(
              // onPressed: () {
              // },
              // child: const Text(
              //   "Send Data",
              //   style: TextStyle(color: Colors.deepPurpleAccent),
              // ))

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyPage extends StatefulWidget {
//   const MyPage({Key? key}) : super(key: key);

//   @override
//   State<MyPage> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   List<Customers> customerList = [];

//   Future<List<Customers>> getCustomers() async {
//     final response =
//         await http.get(Uri.parse("http://192.168.1.67:3000/api/customers/"))
//             as List<Customers>;

//     if (response != null) {
//       print(response);
//       var data = jsonDecode(response.toString()) as List<dynamic>;
//       print(data);
//       // customerList = data
//       //     .map((customerData) => Customers(
//       //           name: customerData["name"],
//       //           phone: customerData["phone"],
//       //           isGold: customerData["isGold"],
//       //         ))
//       // .toList();
//       return customerList;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//           future: getCustomers(),
//           builder: (context, AsyncSnapshot<List<Customers>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: const Icon(Icons.account_tree_rounded),
//                     title: Text(snapshot.data![index].name),
//                     subtitle: Text(snapshot.data![index].phone),
//                     trailing: Text(snapshot.data![index].isGold.toString()),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

// class Customers {
//   String name, phone;
//   bool isGold;

//   Customers({
//     required this.name,
//     required this.phone,
//     required this.isGold,
//   });
// }
