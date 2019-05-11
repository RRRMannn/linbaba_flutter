import 'package:flutter/material.dart';
import '../../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postsDataSource = new PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PaginatedDataTableDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text("Posts"),
              rowsPerPage: 5,         //每页显示行数
              source: _postsDataSource,
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
                    onSort: (int columnIndex, bool ascending) {
                      _postsDataSource._sort((post)=>post.title,ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
//                  DataColumn(
//                    label: Text("Description"),
//                  ),
                DataColumn(
                    label: Text("Author"),
                    onSort: (int columnIndex, bool ascending) {
                      _postsDataSource._sort((post)=>post.author,ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                DataColumn(
                  label: Text("Image"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Post post=_posts[index];

    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
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
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false; //不确定行数设置为true

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  void _sort(getField(post), bool ascending) {
    _posts.sort((a,b){
      if(!ascending){
        final c=a;
        a=b;
        b=c;
      }

      final aValue=getField(a);
      final bValue=getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}
