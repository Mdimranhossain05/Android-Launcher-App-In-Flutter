import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';

class appsController extends GetxController{
  var appList = [].obs;
  var showBottomBar = false.obs;

  Future getApps() async{
    List<Application> _allApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true
    );
  appList.value = _allApps;
  return appList;
  }
  @override
  void onInit() {
    getApps();
    super.onInit();
  }
}