import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/my_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: 'My Profile'.text.make(),
        elevation: 0.0,
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                // height: 548,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  'Sangam Singh'.text.bold.xl2.make(),
                                  10.heightBox,
                                  'sangam.robo@gmail.com'.text.lg.make(),
                                ],
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: 'My Orders'),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: 'My Delivery Address'),
                    listTile(
                        icon: Icons.person_outline, title: 'Refer A Friend'),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: 'Terms and Conditions'),
                    listTile(
                        icon: Icons.policy_outlined, title: 'Privacy Policy'),
                    listTile(icon: Icons.add_chart, title: 'About'),
                    listTile(icon: Icons.exit_to_app_outlined, title: 'Logout'),
                  ],
                ),
              ).expand()
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/66767187?v=4'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile({IconData? icon, String? title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title.toString()),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}