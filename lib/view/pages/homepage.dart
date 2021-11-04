import 'package:ekrut_test/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    homeProvider.setupPageViewController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Consumer<HomeProvider>(
              builder: (context, homeProvider, _) => PageView(
                controller: homeProvider.pageController,
                children: const [
                  RolesPage(),
                  UsersPage(),
                ],
              ),
            )),
            Row(
              children: [
                Expanded(
                    child: BottomMenu(
                  title: "R O L E S",
                  inactive: homeProvider.pageSelected == 0 ? false : true,
                  ontap: () {
                    homeProvider.setPageSelected(0);
                    homeProvider.pageController.animateToPage(
                        homeProvider.pageSelected,
                        curve: Curves.easeInToLinear,
                        duration: Duration(milliseconds: 400));
                    print("page selected -> ${homeProvider.pageSelected}");
                  },
                )),
                Expanded(
                    child: BottomMenu(
                  title: "U S E R S",
                  inactive: homeProvider.pageSelected == 1 ? false : true,
                  ontap: () {
                    homeProvider.setPageSelected(1);
                    homeProvider.pageController.animateToPage(
                        homeProvider.pageSelected,
                        curve: Curves.easeInToLinear,
                        duration: Duration(milliseconds: 400));
                    print("page selected -> ${homeProvider.pageSelected}");
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple.shade100),
              child: const ListTile(
                title: Text("Full name"),
                subtitle: Text("email"),
                trailing: Text("Phone"),
              ),
            ),
          );
        });
  }
}

class RolesPage extends StatelessWidget {
  const RolesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade200),
                  child: const ListTile(
                    title: Text("Title"),
                    subtitle: Text("Description"),
                  ),
                ),
              );
            }),
        Align(
            alignment: const Alignment(0.8, 0.9),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create_role');
              },
              backgroundColor: Colors.orange.shade200,
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu(
      {Key? key,
      required this.title,
      required this.inactive,
      required this.ontap})
      : super(key: key);

  final String title;
  final void Function()? ontap;
  final bool inactive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
        )),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: inactive ? 14 : 18,
                fontWeight: inactive ? FontWeight.w400 : FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
