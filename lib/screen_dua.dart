import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_flutter/controllers/dua_controller.dart';

class ScreenDua extends StatelessWidget {
  const ScreenDua({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController duaController = Get.put(DuaController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Satu'),
      ),
      body: Container(
        child: Obx(() => duaController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: duaController.listdua.value.length,
                itemBuilder: (context, index) {
                  final posts = duaController.listdua.value[index];
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                          '${duaController.listdua.value[index].firstname}'),
                    ),
                    title:
                        Text('${duaController.listdua.value[index].createdAt}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (posts.posts != null)
                          for (var post in posts.posts!)
                            RichText(
                                text: TextSpan(
                                    text: post.title,
                                    style: DefaultTextStyle.of(context).style))
                      ],
                    ),
                  );
                },
              )),
      ),
    );
  }
}
