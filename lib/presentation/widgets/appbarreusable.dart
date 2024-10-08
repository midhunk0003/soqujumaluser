import 'package:customersouqjumla/presentation/provider/notificationprovider/notificationchangiconprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading1;
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    required this.automaticallyImplyLeading1,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          automaticallyImplyLeading1 == true ? true : false,
      backgroundColor: backgroundColor,
      leading: automaticallyImplyLeading1 == true
          ? leading ??
              Consumer<Notificationchangiconprovider>(
                builder: (context, NotifProviderIconchange, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        NotifProviderIconchange.changeIcon(true);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              )
          : null,
      title: title,
      actions: actions ??
          [
            Consumer<Notificationchangiconprovider>(
              builder: (context, NotifProviderIconchange, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Stack(
                    children: [
                      NotifProviderIconchange.isNotificationIcon == true
                          ? IconButton(
                              onPressed: () {
                                NotifProviderIconchange.changeIcon(false);

                                Navigator.pushNamed(context, '/notification');
                              },
                              icon: Image.asset(
                                'assets/images/notificationicon.png',
                              ),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/notificationicon.png',
                              ),
                            ),
                      Positioned(
                        left: 16,
                        right: 1,
                        top: 4,
                        child: CircleAvatar(
                          backgroundColor:
                              NotifProviderIconchange.isNotificationIcon == true
                                  ? Colors.red
                                  : Colors.green,
                          radius: 8,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
    );
  }
}
