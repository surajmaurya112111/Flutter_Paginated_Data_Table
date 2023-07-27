// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:paginated_data_tablr/Model/acticityModal.dart';

class APIHome extends StatefulWidget {
//  ActivityListModel activityListModel;
//   APIHome(this.activityListModel);

  @override
  State<APIHome> createState() => _APIHomeState();
}

class _APIHomeState extends State<APIHome> {
  var arrData = [
    {
      'name': 'Raman',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'abhinav',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'Raman',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'akash',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'vivek',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'Aman',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'akash',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'vivek',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    {
      'name': 'Aman',
      'mobNo': '8996321825',
      'Add': 'Noida',
    },
    // 'Aman', 'vivek', 'akash', 'abhinav', 'Ajay'];
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New API data'),
      ),
      body: ListView(
        children: arrData
            .map((value) => ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(value['name'].toString()),
                      subtitle: Text(value['mobNo'].toString()),
                      trailing: Text(value['Add'].toString()),
                    )
                // {
                //   return Container(
                //     child: Text(value),
                //   );
                // }
                )
            .toList(),
      ),
    );
  }
}
