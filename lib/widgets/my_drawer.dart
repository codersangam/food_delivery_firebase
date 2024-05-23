import 'package:flutter/material.dart';
import 'package:food_delivery/provider/user_provider.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import 'package:food_delivery/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.userProvider,
  });

  final UserProvider userProvider;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.fetchUserDetails();
    var userData = userProvider.currentData;
    return Drawer(
      child: Container(
        color: Vx.red500,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(userData!.userImage ??
                          'https://avatars.githubusercontent.com/u/66767187?v=4'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userData.userName!.text.xl.bold.white.make(),
                      userData.userEmail!.text.white.make(),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                MyListTile(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                MyListTile(
                  icon: Icons.shop,
                  label: 'Cart',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
                MyListTile(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          userProvider: widget.userProvider,
                        ),
                      ),
                    );
                  },
                ),
                MyListTile(
                  icon: Icons.favorite_outline,
                  label: 'Favorite',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WishListScrenn(),
                      ),
                    );
                  },
                ),
                MyListTile(
                  icon: Icons.notifications_outlined,
                  label: 'Notifications',
                  onTap: () {},
                ),
                MyListTile(
                  icon: Icons.star_outline,
                  label: 'Rating & Review',
                  onTap: () {},
                ),
                20.heightBox,
                SizedBox(
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Contact Support'.text.bold.xl2.make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Call Us: '.text.bold.make(),
                          '980-980-1111'.text.make()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Mail Us: '.text.bold.make(),
                          'admin@codersangam.com'.text.make()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label.toString(),
      ),
      onTap: onTap,
    );
  }
}
