import 'package:easytmdb/export/export_all.dart';

class FindExternal {
  Future<Find> externalItem(String id, String externalSourceName) async {
    final response =
        await Utils.fetchData(UrlMaker.find(id, externalSourceName));

    return Find.fromJson(json.decode(response.body));
  }
}
