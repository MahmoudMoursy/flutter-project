import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/account/details_screen.dart';
import 'package:task/consts/app_color.dart';
import 'package:task/consts/app_function.dart';
import 'package:task/signin/sign_in_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({required this.email, super.key});
  final String email;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool notify = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/title.png")),
            const SizedBox(height: 20),

            Row(
              children: [
                Image.asset("assets/profile.png", height: 64, width: 64),
                const SizedBox(width: 15),
                const Text("Mahmoud Moursy", style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 20),

           
            _buildListTile(
              icon: Icons.person_2_outlined,
              title: "Account Details",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(email: widget.email),
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.credit_card,
              title: "Current package | Premium",
            ),
            _buildListTile(
              icon: Icons.message_outlined,
              title: "Contact Us",
            ),
            _buildListTile(
              icon: Icons.reviews_outlined,
              title: "My Review",
            ),

          
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.notifications_outlined, size: 35, color: Colors.grey),
              title: const Text("Notification", style: TextStyle(fontSize: 20, color: Colors.grey)),
              trailing: Switch(
                activeColor: AppColor.primary,
                value: notify,
                onChanged: (value) => setState(() => notify = value),
              ),
            ),

           
            _buildListTile(
              icon: Icons.logout,
              title: "Sign Out",
              iconColor: AppColor.primary,
              textColor: AppColor.primary,
              onTap: () async {
                bool? confirm = await AppFunction.showDialogWidget(
                  img: "assets/dialog3.png",
                  title: "Thanks for Sharing\n your review!",
                  description: "",
                  context: context,
                  isDone: true,
                  isDelete: false,
                );

                if (confirm == true) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("email", 'no');
                  if (mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildListTile({
    required IconData icon,
    required String title,
    Color iconColor = Colors.grey,
    Color textColor = Colors.grey,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 35, color: iconColor),
      title: Text(title, style: TextStyle(fontSize: 20, color: textColor)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
