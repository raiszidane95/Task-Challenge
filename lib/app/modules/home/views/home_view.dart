import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Text("Flutter Assignment"),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      Text(controller.listData.last.section.toString()),
                      Gap(10),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: GridView.builder(
                          physics: PageScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: controller.listData.last.items.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                      controller.listData.last.items[index].productImage.toString())
                                  // child: Image.network(
                                  //     controller.listData.last.items[index].productImage.toString())
                                  ,
                                ),
                                Text(controller.listData.last.items[index].productName.toString())
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        )
        // Column(
        //   children: [
        //     Text(controller.listData.last.items.length.toString()),
        //     Text(controller.listData.first.items.length.toString()),
        //   ],
        // ),

        // ListView(
        //   children: [
        //     ...controller.listData.map((element) => Padding(
        //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        //           child: Padding(
        //             padding: const EdgeInsets.all(15.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   element.section.toString(),
        //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //                 ),
        //                 SizedBox(
        //                   height: 20,
        //                 ),
        //                 Text(element.sectionTitle.toString()),
        //                 SizedBox(height: 20),
        //                 ...element.items.map(
        //                   (e) => Column(
        //                     children: [
        //                       Image.network(
        //                         e.articleImage.toString(),
        //                       ),
        //                       Gap(10),
        //                       Text(
        //                         e.articleTitle.toString(),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ))
        //   ],
        // ),
        );
  }
}
