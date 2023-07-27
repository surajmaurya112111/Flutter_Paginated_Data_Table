// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paginated_data_tablr/Model/acticityModal.dart';
import 'package:paginated_data_tablr/screen/API.dart';
import 'package:paginated_data_tablr/screen/Pagination.dart';
import 'package:paginated_data_tablr/screen/home.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ActivityListModel activityListModel;
  bool isloding = false;
  @override
  void initState() {
    super.initState();

    postData();

    isloding = false;
  }

  postData() async {
    String token =
        'eyJhbGciOiJSUzI1NiIsImtpZCI6ImIyZGZmNzhhMGJkZDVhMDIyMTIwNjM0OTlkNzdlZjRkZWVkMWY2NWIiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiRXVnZW5pbyBGZXJyYW50ZSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS0vQU9oMTRHaWlUM2ZRRU9sdUdxdnBNQ0REZ2w5V0xrN2ltckliOTdJZmg3SkxTN0V5dkt1UTJGQ0l0RkxRUjE1R1JHUXVnN2h0Nll0d2FfWWJJRHZEd0x4eXgwbGh2RVRzT3g5NmhkOUZUV1pRTnZRRFIteHYxM3ZuZHVRMXNweGRwampwWVJGdkdhUUgwLWtVTGQteXhLeTFFaEdNdVdVZjZNa2ZjcUJzRFJSUzU0V1oyZEdWeERMUXkzem5YdmZONnQ5SGc3VXdmVlZtVU1OYXI0M1lPaDdaZWJPVFUtTDFUVzlSZjc0aEZlcU0xUFh3dE92OU5uakkyaFR2SkR1RU9SWTdGOENvUEpwVS1jNE5Kd19Qd3Zyc0tjOGpqOWNxbFRNU0lnTHU2QnFMd0NTV1ZWbkRNZFhaVFNMWVlreC01NXJXdnhiZENJXzNiM0Y3WUJxcXhDNmxmLWNzQTBVcWg1ZmdMYkpFSWhsNERGanMzVlpyc3lSVENsbGp4ZlBiRUtqNDkxUU94ZkRjbUl0QUUwT2FzRFdtSzNVYlh5M1o3U2NyT1dIVlNIOEVjX1JZbjhPZ0toT1hOTmhPUE5Ldm1NbVZnWjFIVXhadS0tNDhpem80eDExWU1rMld4eExUZGdJbDVmWHM2X0FIajdYaTBFRW1CeV9QR2p0TmxDQUJJZzBXbjgwQkdsTDBzNFJZaW9KZV9XbVo1MGRZUGZJOGZnS1B6b1N5MWhMM3A0YzZHR0tzZU1KekxSOEpXZGlUbklWZGFLMXowSGpyRl8xMkI1Vi1UN1lJeHVqQUpKQVBpbjRxNDZ4X1JLUm5lc1lVWjRzUG92cWJReXE5NXJla1FxUVcyZEo0eGFOWXpoUVRpWktRQUZBX1dQV2hPU09SMDhWa2ZEYk1TTlFNS0JJa2FCREdjUWdkUWRTUksxMkxfS2FrdHpvLWtvLTFobEcxMGlXMmdXOU5yVmo5SEdyd3dUaEkyX3lOZzN3YUljMTZfWkJsQmJGdWdCZHhNUmg3NlFsZ0gwUjJmQT1zOTYtYyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9jb2xpdmhxLWRldiIsImF1ZCI6ImNvbGl2aHEtZGV2IiwiYXV0aF90aW1lIjoxNjkwMjYxODc0LCJ1c2VyX2lkIjoiNWY4VXYzRGtTdlN6aTZmbHZUSTBMU3JjdTgwMiIsInN1YiI6IjVmOFV2M0RrU3ZTemk2Zmx2VEkwTFNyY3U4MDIiLCJpYXQiOjE2OTA0NTQ0OTIsImV4cCI6MTY5MDQ1ODA5MiwiZW1haWwiOiJldWdlbmlvQGNhc2FtaWEuY28iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwNzcwMDI4ODEyODA1NjM5ODAwMyJdLCJlbWFpbCI6WyJldWdlbmlvQGNhc2FtaWEuY28iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.XXKW3FJG9r6NoUxHvNHTce-WtmLtr5Z7xRIkvNvoCqno6fWRVpqFwnEQsYaQDnyFbA2g6v9a4-H3X0oJCdNIls99GDYY0lKrx3Rou8PKlsRV43N0Yza-q1IMSWi-4KnSTUuM6y5uDPRjiVDYuyFq49AxvXjtlJqtb93joctA5zk2sT-LnnQ25xjrCZhLVzKvR9nkngcuZlJU20CGylYKsV78Q1jWbC-zuXvQaj2I2UJV5AP27qtSymjFHFfkp35C0kZbWz5NBplPlYPpnfl5cIfaY5KDBsGLM4R8CMmGrSrTFaFwjbpjqOsUMIyahoL8HIhQIO0Jetj9b7eyIS0s9w';

    var response = await http.post(
        Uri.parse(
            "https://asia-east2-colivhq-dev.cloudfunctions.net/activitiesList"),
        body: jsonEncode({
          "todo": true,
          "completed": false,
          "limit": 100,
          "page": 1,
          "move": false,
          "dateTimeZone": "+5:30",
          "type": "myteam",
          "dateTimeOrder": true
        }),
        headers: {
          'Content-Type': 'Application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    print(response.body);
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      activityListModel = ActivityListModel.fromJson(jsonDecode(response.body));

      isloding = true;
      setState(() {});
      print('hello main.dart');
      // print(activityListModel);
    }

    // activityListModel.data[0].opportunityId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Post method with API'),
      // ),
      body: Center(
        child: !isloding
            ? CircularProgressIndicator()
            : Pagination(activityListModel),
      ),
    );
  }

  // void nextPage() {
  //   Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => Pagination(activityListModel)));
  // }
}
