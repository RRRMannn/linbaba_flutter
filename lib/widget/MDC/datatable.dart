import 'package:flutter/material.dart';
import '../../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DataTableDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            DataTable(
//              onSelectAll: (bool value){},
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
//                    label: Container(
//                      width: 150,
//                      child: Text("Title"),
//                    ),
                      label: Text("Title"),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;

                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            debugPrint(a.title.compareTo(b.title).toString());
                            return a.title.compareTo(b.title);
                          });
                        });
                      }),
//                  DataColumn(
//                    label: Text("Description"),
//                  ),
                  DataColumn(
                      label: Text("Author"),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;

                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }

                            return a.author.compareTo(b.author);
                          });
                        });
                      }),
                  DataColumn(
                    label: Text("Image"),
                  )
                ],
                rows: posts.map((post) {
                  return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value) {
                      setState(() {
                        post.selected = value;
                      });
                    },
                    cells: [
                      DataCell(
                        Text(post.title),
                      ),
//                    DataCell(
//                      Text(post.description),
//                    ),
                      DataCell(
                        Text(post.author),
                      ),
                      DataCell(
                        Image.network(post.imageUrl),
                      ),
                    ],
                  );
                }).toList())
          ],
        ),
      ),
    );
  }
}
