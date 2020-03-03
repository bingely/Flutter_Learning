

import 'package:flutter_qyyim/common/db/solution2/base_db_provider.dart';

class ChatDao extends BaseDBProvider{

  final String name = "chat";

  final String columnId = "_id";


  @override
  tableName() {
    return "chat";
  }

  @override
  tableSqlString() {
    return tableBaseString(name, columnId)+
    '''
    ''';
  }

}