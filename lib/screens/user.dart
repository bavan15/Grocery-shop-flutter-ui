import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<DarkThemeProvider>();
    bool _isDark = themeState.getDarkTheme;
    final Color color = _isDark ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                      text: 'Hi,  ',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                    TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('my name is pressed.');
                          }),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              TextWidget(
                title: 'Email@email.com',
                textSize: 18,
                color: color,
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 2),
              const SizedBox(height: 20),
              _buildListTiles(
                  title: 'Address',
                  subTitle: 'Subtitle here',
                  icon: IconlyLight.profile,
                  color: color,
                  onPressed: () async => await _showAddressDialog()),
              _buildListTiles(
                title: 'Orders',
                icon: IconlyLight.bag,
                color: color,
                onPressed: () {},
              ),
              _buildListTiles(
                title: 'Wishlist',
                icon: IconlyLight.heart,
                color: color,
                onPressed: () {},
              ),
              _buildListTiles(
                title: 'Viewed',
                icon: IconlyLight.show,
                color: color,
                onPressed: () {},
              ),
              _buildListTiles(
                title: 'Forget password',
                icon: IconlyLight.password,
                color: color,
                onPressed: () {},
              ),
              SwitchListTile(
                value: _isDark,
                title: TextWidget(
                  title: _isDark ? 'Dark mode' : 'Light mode',
                  textSize: 22,
                  isTitle: true,
                  color: color,
                ),
                secondary: Icon(
                  _isDark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                onChanged: (bool value) {
                  context.read<DarkThemeProvider>().setDarkTheme = value;
                },
              ),
              _buildListTiles(
                title: 'Logout',
                icon: IconlyLight.logout,
                color: color,
                onPressed: () async => await _showLogoutDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              const Text('Sign out'),
            ],
          ),
          content: const Text('Do your wanna sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                if(Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                title: 'Cancel',
                textSize: 18,
                color: Colors.cyan,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                title: 'Ok',
                textSize: 18,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Your address'),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('update'),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildListTiles(
    {required String title,
    String? subTitle,
    required IconData icon,
    required Color color,
    required Function() onPressed}) {
  return ListTile(
    title: TextWidget(
      title: title,
      textSize: 22,
      isTitle: true,
      color: color,
    ),
    subtitle: TextWidget(
      title: subTitle ?? '',
      textSize: 18,
      color: color,
    ),
    leading: Icon(icon),
    trailing: const Icon(IconlyLight.arrowRight2),
    onTap: onPressed,
  );
}
