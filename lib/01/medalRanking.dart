import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("奖牌榜"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.settings)],
          elevation: 0.0,
          centerTitle: true,
        ),
        body: UserList());
  }
}

class User {
  bool selected;
  String country;
  int gold;
  int silver;
  int bronze;
  int total;

  User(this.country, this.gold, this.silver, this.bronze, this.total,
      {this.selected = false});
}

class UserList extends StatefulWidget {
  UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> data = [
    User("images/china.png", 38, 32, 18, 88),
    User("images/japan.png", 27, 14, 17, 58),
    User("images/us.png", 39, 41, 33, 113),
    User("images/russia.png", 20, 28, 23, 71),
    User("images/australia.png", 17, 7, 22, 46),
    User("images/uk.png", 22, 21, 22, 65),
  ];

  var _sortAscending = true;
  int _sortIndex = 1;

  List<DataRow> _getUserRows() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < data.length; i++) {
      dataRows.add(DataRow(
          selected: data[i].selected,
          onSelectChanged: (selected) {
            setState(() {
              data[i].selected = selected!;
            });
          },
          cells: [
            DataCell(Image.asset('${data[i].country}', width: 65)),
            DataCell(Text('${data[i].gold}')),
            DataCell(Text('${data[i].silver}')),
            DataCell(Text('${data[i].bronze}')),
            DataCell(Text('${data[i].total}')),
          ]));
    }

    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortColumnIndex: _sortIndex,
            sortAscending: _sortAscending,
            dataRowHeight: 100,
            horizontalMargin: 20,
            columnSpacing: 100,
            columns: [
              DataColumn(label: Text('国家/地区')),
              DataColumn(
                  label: Text('金牌数'),
                  numeric: true,
                  onSort: (int columnIndex, bool asscending) {
                    setState(() {
                      _sortIndex = columnIndex;
                      _sortAscending = asscending;
                      if (asscending) {
                        data.sort((a, b) => a.gold.compareTo(b.gold));
                      } else {
                        data.sort((a, b) => b.gold.compareTo(a.gold));
                      }
                    });
                  }),
              DataColumn(
                  label: Text('银牌数'),
                  numeric: true,
                  onSort: (int columnIndex, bool asscending) {
                    setState(() {
                      _sortIndex = columnIndex;
                      _sortAscending = asscending;
                      if (asscending) {
                        data.sort((a, b) => a.silver.compareTo(b.silver));
                      } else {
                        data.sort((a, b) => b.silver.compareTo(a.silver));
                      }
                    });
                  }),
              DataColumn(
                  label: Text('铜牌数'),
                  numeric: true,
                  onSort: (int columnIndex, bool asscending) {
                    setState(() {
                      _sortIndex = columnIndex;
                      _sortAscending = asscending;
                      if (asscending) {
                        data.sort((a, b) => a.bronze.compareTo(b.bronze));
                      } else {
                        data.sort((a, b) => b.bronze.compareTo(a.bronze));
                      }
                    });
                  }),
              DataColumn(
                  label: Text('总奖牌数'),
                  numeric: true,
                  onSort: (int columnIndex, bool asscending) {
                    setState(() {
                      _sortIndex = columnIndex;
                      _sortAscending = asscending;
                      if (asscending) {
                        data.sort((a, b) => a.total.compareTo(b.total));
                      } else {
                        data.sort((a, b) => b.total.compareTo(a.total));
                      }
                    });
                  })
            ],
            rows: _getUserRows(),
            // [
            //   DataRow(
            //     cells: [
            //       DataCell(Text('张三')),
            //       DataCell(Text('18')),
            //       DataCell(Text('男')),
            //       DataCell(Text('一个男人')),
            //     ]
            //   ),
            //   DataRow(
            //     cells: [
            //       DataCell(Text('张三')),
            //       DataCell(Text('18')),
            //       DataCell(Text('男')),
            //       DataCell(Text('一个男人')),
            //     ]
            //   ),
            //   DataRow(
            //     cells: [
            //       DataCell(Text('张三')),
            //       DataCell(Text('18')),
            //       DataCell(Text('男')),
            //       DataCell(Text('一个男人')),
            //     ]
            //   )
            // ]
          )),
    );
  }
}
