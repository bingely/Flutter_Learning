import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission() async {
  /*final permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.location]);*/

  if (await Permission.location.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    return true;

  }else {
    return false;
  }

}
