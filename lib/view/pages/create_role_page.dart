import 'package:ekrut_test/controller/role_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRolePage extends StatelessWidget {
  const CreateRolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roleProvider = Provider.of<RoleProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " C r e a t e   R o l e ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          CreateRoleTextField(
            title: "Title",
            textEditingController: roleProvider.titletexteditingcontroller,
          ),
          CreateRoleTextField(
            title: "Description",
            textEditingController:
                roleProvider.descriptiontexteditingcontroller,
          ),
          CreateRoleTextField(
            title: "Requirement",
            textEditingController:
                roleProvider.requirementtexteditingcontroller,
          ),
          SizedBox(
            height: height * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "S u b m i t",
                      style: TextStyle(fontSize: 18),
                    ))),
          )
        ],
      )),
    );
  }
}

class CreateRoleTextField extends StatelessWidget {
  const CreateRoleTextField({
    Key? key,
    required this.title,
    required this.textEditingController,
  }) : super(key: key);
  final String title;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)),
            ),
          )
        ],
      ),
    );
  }
}
