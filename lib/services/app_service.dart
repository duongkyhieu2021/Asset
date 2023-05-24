import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class AppService {
  Future<bool> requestLocationPermission() async {
    return await requestPermission(Permission.location);
  }

  Future<bool> requestPermission(Permission permission) async {
    final PermissionStatus status = await permission.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(
          msg:
              "Thiết bị đang chặn quyền truy cập vị trí! Vào phần cài đặt ứng dụng mở lại");
      return false;
    }
    return false;
  }
}
