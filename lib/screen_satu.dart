import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_flutter/controllers/satu_controller.dart';

class ScreenSatu extends StatelessWidget {
  const ScreenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    SatuController satuController = Get.put(SatuController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Satu'),
      ),
      body: Container(
        child: Obx(() => satuController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: satuController.listsatu.value.length,
                itemBuilder: (context, index) {
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${satuController.listsatu.value[index].userId}'),
                    ),
                    title: Text('${satuController.listsatu.value[index].name}'),
                    subtitle: Text('${satuController.listsatu.value[index].email}'),
                  );
                },
              )),
      ),
    );
  }
}
