import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:login/auth/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensure the keyboard pushes the bottom bar up
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with Profile Details
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Khukan Ahmed',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(fontSize: 12.0, color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color: Colors.white, size: 18),
                        onPressed: () {
                          // Add functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.video_call,
                            color: Colors.white, size: 18),
                        onPressed: () {
                          // Add functionality
                        },
                      ),
                    ],
                  ),
                ],
              ),
              background: Container(
                color: Colors.amber.shade100,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Khukan Ahmed'),
                        Row(
                          children: [
                            badges.Badge(
                              position: badges.BadgePosition.topEnd(),
                              badgeContent: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              child: Icon(
                                Icons.notifications_none_outlined,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.logout),
                              onPressed: loginController.logout,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recent Activities Section
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 15, // Example count
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(Icons.history, color: Colors.amber),
                          title: Text('Activity ${index + 1}'),
                          subtitle: Text('Details about the activity'),
                        ),
                      );
                    },
                  ),
                  //SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),

      // Text Field Section at the Bottom
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                final message = messageController.text;
                if (message.isNotEmpty) {
                  if (kDebugMode) {
                    print('///////////////Message sent: $message');
                  }
                  messageController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(14),
                backgroundColor: Colors.blue,
              ),
              child: Icon(Icons.send, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
