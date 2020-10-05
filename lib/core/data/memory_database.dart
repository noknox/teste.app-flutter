import 'package:meta/meta.dart';
import 'package:database/database.dart';
import 'package:teste_app_flutter/core/data/base_model.dart';

abstract class MemoryDatabase<T extends BaseModel> {
  String table;
  final _database = MemoryDatabaseAdapter().database();

  MemoryDatabase({this.table}) {
    this.setup();
  }

  @protected
  void setup();

  @protected
  Future insert(T data) async {
    await _database.collection(this.table).insert(data: data.toJson());
  }

  @protected
  Future<List<Map<String, Object>>> readAll(int skip, int take, {String sortedBy, bool isSortedDescending = false}) async {
    final query = Query(
      sorter: sortedBy?.isNotEmpty == true ? PropertySorter(sortedBy, isDescending: isSortedDescending) : null,
      skip: skip,
      take: take,
    );

    // Define what we are searching
    final result = await _database.collection(this.table)
        .search(reach: Reach.local, query: query);
    return result.snapshots.map((e) => e.data).toList();
  }

  @protected
  Future teardown() async {
    await _database.collection(this.table).searchAndDelete();
  }
}