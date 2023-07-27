// The "soruce" of the table
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, empty_constructor_bodies, no_logic_in_create_state, equal_keys_in_map, prefer_const_literals_to_create_immutables, prefer_const_constructor, prefer_const_constructors, sort_child_properties_last, unused_import, prefer_is_not_empty, unnecessary_null_comparison, avoid_print, prefer_if_null_operators, unnecessary_cast, unused_local_variable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, deprecated_member_use, sized_box_for_whitespace, unused_label, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:paginated_data_tablr/Model/acticityModal.dart';
import 'package:paginated_data_tablr/main.dart';
import 'package:intl/intl.dart';
import 'package:paginated_data_tablr/screen/Follow-up-contact.dart';
import 'package:paginated_data_tablr/screen/secondAPI.dart';

class Pagination extends StatefulWidget {
  ActivityListModel activityListModel;
  Pagination(this.activityListModel);

  @override
  State<Pagination> createState() => _HomeScreenState(activityListModel);
}

class _HomeScreenState extends State<Pagination> {
  late ActivityListModel activityListModel;
  _HomeScreenState(this.activityListModel);
  //final DataTableSource _data = MyData(activityListModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 171, 171, 171),
        title: Row(
          children: [
            const Text('Post method with API'),
            Spacer(),
            IconButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              iconSize: 25,
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                main();
              },
            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              iconSize: 25,
              icon: const Icon(
                Icons.notifications,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                Spacer(),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 84, 216, 89),
                  child: IconButton(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      iconSize: 30,
                      icon: const Icon(
                        Icons.refresh,
                      ),
                      onPressed: () {
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PaginatedDataTable(
            dataRowHeight: 60,
            source: MyData(activityListModel, context),
            columns: const [
              // DataColumn(
              //     label: Text(
              //   '',
              //   style: TextStyle(fontSize: 1),
              // )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(fontSize: 1),
              )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(fontSize: 1),
              )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(fontSize: 1),
              )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(fontSize: 1),
              )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(fontSize: 1),
              )),
              // DataColumn(label: Text('')),
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 7,
            showCheckboxColumn: false,
          ),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  var activityId;

  ActivityListModel activityListModel;

  // ignore: non_constant_identifier_names

  List<Map<String, dynamic>> _data = [];

  var context;
  MyData(this.activityListModel, this.context) {
    // print(_data);
    // var positon = activityListModel.data;
    //print(positon);
    // var positon1;
    // for (int i = 0; i < 1; i++) {
    //   positon1 = i;

    _data = List.generate(
        activityListModel.data.length,
        (index) => {
              "id": activityListModel.data[index].id,
              "Today": DateFormat('yyyy-MM-dd').format(DateTime.parse(
                  activityListModel.data[index].createdDate.toString())),
              "members": activityListModel.data[index].members,
              "Activity": activityListModel.data[index].activityType.toString(),
              "Description":
                  activityListModel.data[index].activityDescription.toString(),
              "Image":
                  activityListModel.data[index].todoOwnerPicture.toString(),
            });
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(onSelectChanged: (v) {}, cells: [
      DataCell(GestureDetector(
        onTap: () {
          getRightSiderBar();
          activityId = _data[index]['id'];
        },
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Today'),
            Text(_data[index]['Today']),
          ],
        ),
      )),
      DataCell(
        Container(
          height: 48,
          child: SingleChildScrollView(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _data[index]['members']
                    .map((value) {
                      // return ListTile(
                      // contentPadding: EdgeInsets.symmetric(
                      //     vertical: 0.0, horizontal: 0.0),
                      // dense: true,
                      // contentPadding: EdgeInsets.zero,

                      //title:
                      return Column(
                        children: [
                          Text(
                            value.preferredName.toString() +
                                "  ( " +
                                value.preferredName.toString() +
                                "  " +
                                value.memberFirst.toString() +
                                " " +
                                " )",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );

                      //  );
                    })
                    .toList()
                    .cast<Widget>()),
          ),
        ),
      ),
      DataCell(Text(_data[index]['Activity'].toString())),
      DataCell(Container(
        width: 450,
        child: Text(
          _data[index]['Description'].toString(),
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.visible,
        ),
      )),
      DataCell(Row(children: [
        CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(_data[index]['Image'].toString())),
        SizedBox(
          width: 5,
        ),
        Checkbox(value: false, onChanged: null),
        IconButton(onPressed: () {}, icon: Icon(Icons.contact_page_outlined)),
        PopupMenuButton(itemBuilder: ((context) {
          return [
            PopupMenuItem(
              child: Text('Edit'),
              value: 'edit',
            ),
          ];
        })),
      ])),
    ]);
  }

  getRightSiderBar([data]) {
    print('hello method');
    showDialog(
        context: context,
        builder: (context) {
          return SecondAPI(
            activityId: activityId,
          );
        });
  }
}
