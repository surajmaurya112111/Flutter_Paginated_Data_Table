// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final int _itemsPerPage = 10;
  List<String> items = [];
  int _currentPage = 1;
  bool _isLoading = false;

  // bool islodingData = false;
  // bool hasMoreData = true;
  int numberOfPages = 10;
  int curentPage = 0;
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  // void getData() async {
  //   if (!islodingData && hasMoreData) {
  //     islodingData = true;
  //     setState(() {});
  //     Future.delayed(Duration(seconds: 1));

  //     List<String> dummyDataList = items.length > 100
  //         ? []
  //         : List.generate(30, (index) => "Index :${index + items.length}");
  //     if (dummyDataList.isEmpty) {
  //       hasMoreData = false;
  //     }
  //     items.addAll(dummyDataList);

  //     islodingData = false;
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
        (index) => Text(
              'pages Number:${index + 1}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 192, 18, 18), fontSize: 20),
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Paginated_data_table'),
      ),
      body: Row(
        children: [
          NavigationRail(
              extended: isExpanded,
              backgroundColor: Color.fromARGB(255, 32, 122, 248),
              unselectedIconTheme: IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255), opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme: IconThemeData(
                  color: const Color.fromARGB(255, 255, 255, 255)),
              destinations: [
                NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.bar_chart), label: Text('Rapports')),
                NavigationRailDestination(
                    icon: Icon(Icons.person), label: Text('Profile')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text('Setting')),
              ],
              selectedIndex: 0),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(60.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: Icon(Icons.menu)),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/OIP.jRLQ6Ds4GyKLweIpip6ZgwHaE7?pid=ImgDet&rs=1'),
                        radius: 22.0,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.article,
                                    size: 22.0,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Articals',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                ' 6 Articles',
                                style: TextStyle(
                                    fontSize: 46, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )),
                      Flexible(
                          child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.comment,
                                    size: 22.0,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Comment',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                '+32 Comments',
                                style: TextStyle(
                                    fontSize: 46,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '6 Artucales',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '3 new Articales',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        width: 300.0,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type Article Title",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 11, 105, 228),
                          ),
                          label: Text('2023, July, 20,July, 21,July, 22,')),
                      Row(
                        children: [
                          DropdownButton(
                              hint: Text('Filter by'),
                              items: [
                                DropdownMenuItem(
                                    value: "Date", child: Text("Date")),
                                DropdownMenuItem(
                                    value: "Comments", child: Text("Comments")),
                                DropdownMenuItem(
                                    value: "Views", child: Text("Views"))
                              ],
                              onChanged: (value) {}),
                          DropdownButton(
                              hint: Text('Order by'),
                              items: [
                                DropdownMenuItem(
                                    value: "Date", child: Text("Date")),
                                DropdownMenuItem(
                                    value: "Comments", child: Text("Comments")),
                                DropdownMenuItem(
                                    value: "Views", child: Text("Views"))
                              ],
                              onChanged: (value) {}),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     DataTable(
                  //       headingRowColor: MaterialStateProperty.resolveWith(
                  //           (states) =>
                  //               const Color.fromARGB(255, 184, 184, 184)),
                  //       columns: [
                  //         DataColumn(label: Text('ID')),
                  //         DataColumn(label: Text('Artical Title')),
                  //         DataColumn(label: Text('Creation Date')),
                  //         DataColumn(label: Text('View')),
                  //         DataColumn(label: Text('Comments'))
                  //       ],
                  //       rows: [
                  //         DataRow(cells: [
                  //           DataCell(Text('0')),
                  //           DataCell(Text('How to build a Flutter Web App')),
                  //           DataCell(Text("${DateTime.now()}")),
                  //           DataCell(Text("2.3k View")),
                  //           DataCell(Text("102 Comments")),
                  //         ]),
                  //         DataRow(cells: [
                  //           DataCell(Text('1')),
                  //           DataCell(Text('How to build a Flutter Web App')),
                  //           DataCell(Text("${DateTime.now()}")),
                  //           DataCell(Text("2.3k View")),
                  //           DataCell(Text("102 Comments")),
                  //         ]),
                  //         DataRow(cells: [
                  //           DataCell(Text('2')),
                  //           DataCell(Text('How to build a Flutter Web App')),
                  //           DataCell(Text("${DateTime.now()}")),
                  //           DataCell(Text("2.3k View")),
                  //           DataCell(Text("102 Comments")),
                  //         ]),
                  //         DataRow(cells: [
                  //           DataCell(Text('3')),
                  //           DataCell(Text('How to build a Flutter Web App')),
                  //           DataCell(Text("${DateTime.now()}")),
                  //           DataCell(Text("2.3k View")),
                  //           DataCell(Text("102 Comments")),
                  //         ]),
                  //       ],
                  //     ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       height: 150,
                  //       child: Expanded(
                  //           child: ListView.builder(
                  //               itemCount: items.length,
                  //               itemBuilder: (context, index) {
                  //                 return ListTile(
                  //                   title: Row(
                  //                     children: [
                  //                       Text('${index + 1}'),
                  //                       SizedBox(
                  //                         width: 20,
                  //                       ),
                  //                       Text('fghj'),
                  //                     ],
                  //                   ),
                  //                 );
                  //               })),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    width: 700,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: pages[curentPage],
                        )),
                        NumberPaginator(
                          numberPages: numberOfPages,
                          onPageChange: (index) {
                            setState(() {
                              curentPage = index;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           '1',
                  //           style: TextStyle(color: Colors.blue),
                  //         )),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           '2',
                  //           style: TextStyle(color: Colors.blue),
                  //         )),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           '3',
                  //           style: TextStyle(color: Colors.blue),
                  //         )),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           '4',
                  //           style: TextStyle(color: Colors.blue),
                  //         )),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           'See All',
                  //           style: TextStyle(color: Colors.blue),
                  //         )),
                  //   ],
                  // )
                  //   ],
                  // )
                ],
              ),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
