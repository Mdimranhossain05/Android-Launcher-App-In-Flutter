import 'package:flutter/material.dart';
import 'package:launcher/controller.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:device_apps/device_apps.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var controller = Get.put(appsController()); //Get.pust() using to access package name via controller

    changingicon(index){   //making method to get the Icon and when its dialer and vending Icon will be changed
      if(controller.appList.value[index].packageName == "com.google.android.dialer"){
        return Image.asset("assets/images/telephone.png");
      }if(controller.appList.value[index].packageName == "com.android.vending"){
        return Image.asset("assets/images/playstore3.png");
      }if(controller.appList.value[index].packageName == "com.facebook.orca"){
        return Image.asset("assets/images/messenger.png");
      }
      else{
        return Image.memory(controller.appList.value[index].icon);
      }
    }

    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: Image.asset("assets/images/backgroundimage1.jpg",fit: BoxFit.fill),
        ),
        Padding(
          padding: EdgeInsets.all(8.00),
          child:Obx((){
            return GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 30,
              crossAxisSpacing: 1,
              children:
                List.generate(controller.appList.value.length, (index) {
                  return Container(
                    child: GestureDetector(
                      onTap: (){
                        DeviceApps.openApp(controller.appList.value[index].packageName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 58),
                        child: SingleChildScrollView(

                          child: Column(
                            children: [
                              Container(child: changingicon(index),width: 50,height: 50,),
                              SizedBox(height: 5,),
                              Wrap(
                                children: [
                                  Text(controller.appList.value[index].appName,style: TextStyle(color: Colors.white,),overflow: TextOverflow.visible,),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  );
                }),
            );
          }),
        ),
        Container(
          child: Row(
            children: [
              GlassContainer.frostedGlass(
                height: size.height,
                width: size.width*0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap : (){
                        DeviceApps.openApp(controller.appList.value[32].packageName);
                      },
                      child: Padding(padding: EdgeInsets.all(8),
                        child: Image.asset("assets/images/telephone.png"),
                      ),
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap : (){
                        DeviceApps.openApp(controller.appList.value[18].packageName);
                      },
                      child: Padding(padding: EdgeInsets.all(2),
                        child: Image.asset("assets/images/playstore3.png"),
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
