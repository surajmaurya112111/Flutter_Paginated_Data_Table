// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_import, sized_box_for_whitespace, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, unused_field, prefer_final_fields, duplicate_ignore, sort_child_properties_last, prefer_typing_uninitialized_variables, must_be_immutable, no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:paginated_data_tablr/Model/activityDetales.dart';

class SecondAPI extends StatefulWidget {
  var activityId;

  SecondAPI({super.key, required this.activityId});

  @override
  State<SecondAPI> createState() => _SecondAPIState(activityId);
}

class _SecondAPIState extends State<SecondAPI> {
  late ActivityDetales activityDetales;
  var activityId;
  _SecondAPIState(this.activityId);
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _secdata = [];

  late final Color? iconColor;
  bool isloding = false;

  var valueChoose;
  @override
  void initState() {
    super.initState();
    secondpostData(activityId);
  }

//"bd9718ab-5a2e-4855-8e02-5c0aafa34da0"
  secondpostData(var activityId) async {
    String token =
        'eyJhbGciOiJSUzI1NiIsImtpZCI6ImIyZGZmNzhhMGJkZDVhMDIyMTIwNjM0OTlkNzdlZjRkZWVkMWY2NWIiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiRXVnZW5pbyBGZXJyYW50ZSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS0vQU9oMTRHaWlUM2ZRRU9sdUdxdnBNQ0REZ2w5V0xrN2ltckliOTdJZmg3SkxTN0V5dkt1UTJGQ0l0RkxRUjE1R1JHUXVnN2h0Nll0d2FfWWJJRHZEd0x4eXgwbGh2RVRzT3g5NmhkOUZUV1pRTnZRRFIteHYxM3ZuZHVRMXNweGRwampwWVJGdkdhUUgwLWtVTGQteXhLeTFFaEdNdVdVZjZNa2ZjcUJzRFJSUzU0V1oyZEdWeERMUXkzem5YdmZONnQ5SGc3VXdmVlZtVU1OYXI0M1lPaDdaZWJPVFUtTDFUVzlSZjc0aEZlcU0xUFh3dE92OU5uakkyaFR2SkR1RU9SWTdGOENvUEpwVS1jNE5Kd19Qd3Zyc0tjOGpqOWNxbFRNU0lnTHU2QnFMd0NTV1ZWbkRNZFhaVFNMWVlreC01NXJXdnhiZENJXzNiM0Y3WUJxcXhDNmxmLWNzQTBVcWg1ZmdMYkpFSWhsNERGanMzVlpyc3lSVENsbGp4ZlBiRUtqNDkxUU94ZkRjbUl0QUUwT2FzRFdtSzNVYlh5M1o3U2NyT1dIVlNIOEVjX1JZbjhPZ0toT1hOTmhPUE5Ldm1NbVZnWjFIVXhadS0tNDhpem80eDExWU1rMld4eExUZGdJbDVmWHM2X0FIajdYaTBFRW1CeV9QR2p0TmxDQUJJZzBXbjgwQkdsTDBzNFJZaW9KZV9XbVo1MGRZUGZJOGZnS1B6b1N5MWhMM3A0YzZHR0tzZU1KekxSOEpXZGlUbklWZGFLMXowSGpyRl8xMkI1Vi1UN1lJeHVqQUpKQVBpbjRxNDZ4X1JLUm5lc1lVWjRzUG92cWJReXE5NXJla1FxUVcyZEo0eGFOWXpoUVRpWktRQUZBX1dQV2hPU09SMDhWa2ZEYk1TTlFNS0JJa2FCREdjUWdkUWRTUksxMkxfS2FrdHpvLWtvLTFobEcxMGlXMmdXOU5yVmo5SEdyd3dUaEkyX3lOZzN3YUljMTZfWkJsQmJGdWdCZHhNUmg3NlFsZ0gwUjJmQT1zOTYtYyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9jb2xpdmhxLWRldiIsImF1ZCI6ImNvbGl2aHEtZGV2IiwiYXV0aF90aW1lIjoxNjkwMjYxODc0LCJ1c2VyX2lkIjoiNWY4VXYzRGtTdlN6aTZmbHZUSTBMU3JjdTgwMiIsInN1YiI6IjVmOFV2M0RrU3ZTemk2Zmx2VEkwTFNyY3U4MDIiLCJpYXQiOjE2OTA0NTQ0OTIsImV4cCI6MTY5MDQ1ODA5MiwiZW1haWwiOiJldWdlbmlvQGNhc2FtaWEuY28iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwNzcwMDI4ODEyODA1NjM5ODAwMyJdLCJlbWFpbCI6WyJldWdlbmlvQGNhc2FtaWEuY28iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.XXKW3FJG9r6NoUxHvNHTce-WtmLtr5Z7xRIkvNvoCqno6fWRVpqFwnEQsYaQDnyFbA2g6v9a4-H3X0oJCdNIls99GDYY0lKrx3Rou8PKlsRV43N0Yza-q1IMSWi-4KnSTUuM6y5uDPRjiVDYuyFq49AxvXjtlJqtb93joctA5zk2sT-LnnQ25xjrCZhLVzKvR9nkngcuZlJU20CGylYKsV78Q1jWbC-zuXvQaj2I2UJV5AP27qtSymjFHFfkp35C0kZbWz5NBplPlYPpnfl5cIfaY5KDBsGLM4R8CMmGrSrTFaFwjbpjqOsUMIyahoL8HIhQIO0Jetj9b7eyIS0s9w';

    var secondresponse = await http.post(
        Uri.parse(
            "https://asia-east2-colivhq-dev.cloudfunctions.net/activityDetails"),
        body: jsonEncode({"activityId": activityId.toString()}),
        headers: {
          'Content-Type': 'Application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print(activityId);
    print(secondresponse.body);
    //print(jsonDecode(secondresponse.body));
    print('hello activity id');
    if (secondresponse.statusCode == 200) {
      activityDetales =
          ActivityDetales.fromJson(jsonDecode(secondresponse.body));

      print("byvt$activityDetales");

      isloding = true;
      setState(() {});

      // print(activityDetales);
    }

    // activityListModel.data[0].opportunityId;
  }

  @override
  Widget build(BuildContext context) {
    return !isloding
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 550,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      color: Color.fromARGB(255, 109, 207, 18),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              activityDetales.data.members[0].memberFirst
                                      .toString() +
                                  " " +
                                  activityDetales.data.activityType.toString() +
                                  " " +
                                  DateFormat('MMM dd, yyyy').format(
                                      DateTime.parse(activityDetales
                                          .data.todoDate
                                          .toString())) +
                                  " ",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              // direction: Axis.horizontal,
                              children: activityDetales.data.members.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, bottom: 20),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Color.fromARGB(255, 151, 217, 113)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          color: Color.fromARGB(
                                              255, 219, 230, 239),
                                          size: 40,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 7.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    e.preferredName.toString()),
                                                Container(
                                                  width: 145,
                                                  child: Text(
                                                    "( " +
                                                        e.memberFirst
                                                            .toString() +
                                                        " " +
                                                        e.memberLast
                                                            .toString() +
                                                        " )",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),

                                                // Text(activityDetales
                                                //         .data.members[0].preferredName
                                                //         .toString() +
                                                //     " "),
                                                // Text("( " +
                                                //     activityDetales
                                                //         .data.members[0].memberFirst
                                                //         .toString() +
                                                //     " " +
                                                //     activityDetales
                                                //         .data.members[0].memberLast
                                                //         .toString() +
                                                //     " )"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 50,
                                width: 260,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 204, 204, 204)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Color.fromARGB(255, 36, 36, 36),
                                      size: 40,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 7.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(activityDetales.data.homeName
                                                  .toString() +
                                              " "),
                                          Text(activityDetales.data.roomName
                                                  .toString() +
                                              " "),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Container(
                                height: 50,
                                width: 260,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 204, 204, 204)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.wallet_travel,
                                      color: Color.fromARGB(255, 36, 36, 36),
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 7.0,
                                    ),
                                    Text(activityDetales.data.opportunityName
                                            .toString() +
                                        " "),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.wrap_text,
                                        color: Color.fromARGB(255, 36, 36, 36),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Container(
                                height: 50,
                                width: 260,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 236, 207, 227)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 4,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          activityDetales.data.todoOwnerPicture
                                              .toString()),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Text(activityDetales.data.todoOwnerName
                                            .toString() +
                                        " "),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.wrap_text,
                                        color: Color.fromARGB(255, 36, 36, 36),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Container(
                                height: 115,
                                width: 500,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 229, 229, 229)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.short_text,
                                            color:
                                                Color.fromARGB(255, 36, 36, 36),
                                            size: 40,
                                          ),
                                        ),
                                        Text(activityDetales.data.activityType
                                                .toString() +
                                            " "),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.format_align_left,
                                            color:
                                                Color.fromARGB(255, 36, 36, 36),
                                            size: 40,
                                          ),
                                        ),
                                        Text(activityDetales
                                                .data.activityDescription
                                                .toString() +
                                            " "),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Column(
                                children: [
                                  ExpansionTile(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.account_circle),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                Text(activityDetales
                                                        .data.todoOwnerName
                                                        .toString() +
                                                    " "),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_today),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                Text(DateFormat(
                                                        'MMM dd, yyyy kk:mm')
                                                    .format(DateTime.parse(
                                                        activityDetales
                                                            .data.createdDate
                                                            .toString()))),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                    title: Row(
                                      children: [
                                        Text(
                                          'Todo',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Checkbox(value: false, onChanged: null)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, bottom: 40, right: 20),
                              child: Row(
                                children: [
                                  Card(
                                    clipBehavior: Clip.hardEdge,
                                    elevation: 15.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        onPressed: () {},
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 12.0,
                                    backgroundColor: const Color.fromARGB(
                                        255, 236, 236, 236),
                                    child: Checkbox(
                                        checkColor: const Color.fromARGB(
                                            255, 109, 227, 113),
                                        value: false,
                                        onChanged: null),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
