import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'info_panel.dart';
import 'map/map.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController dataController = Get.put(HomeController());
  final minWidth = 500.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: max(screenWidth, minWidth),
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: FMap(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: Obx(
                  () => dataController.isDataLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : InfoPanel(),
                ),
                // Container(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
