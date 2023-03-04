import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class InfoPanel extends StatelessWidget {
  InfoPanel({super.key});
  final HomeController dataController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataController.usemrModel!.data!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dataController.usemrModel!.data![index].name!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(
                              dataController
                                  .usemrModel!.data![index].description!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
