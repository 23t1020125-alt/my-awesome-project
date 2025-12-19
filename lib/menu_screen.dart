import 'package:flutter/material.dart';
import 'widgets/app_styles.dart';
import 'screens/news/news_list.dart';
import 'screens/product/my_product.dart';
import 'screens/auth/profile.dart';
import 'screens/utilities/counter.dart';
import 'screens/utilities/change_color.dart';
import 'screens/utilities/feedback.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kAppBackgroundDecoration,
        child: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // --- HEADER: PROFILE (TRÁI) - NOTIFICATION (PHẢI) ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 1. Avatar Profile (Bấm vào để sang ProfileScreen)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProfileScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kDarkColor, width: 2),
                            ),
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage("https://i.pravatar.cc/300"), // Ảnh mẫu online
                              // Nếu lỗi mạng hoặc thích icon thì dùng dòng dưới:
                              // backgroundColor: Colors.white,
                              // child: Icon(Icons.person, color: kDarkColor),
                            ),
                          ),
                        ),

                        // 2. Notification Icon
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black12),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: const Icon(Icons.notifications_outlined, color: kDarkColor),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    const Text(
                      "Hi Nixtio,",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: kGreyColor,
                        height: 1.1,
                      ),
                    ),
                    const Text(
                      "Find your\nfavorites here",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: kDarkColor,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // --- GRID MENU ---
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: [
                        _buildFeatureCard(
                          context,
                          Icons.newspaper,
                          "News",
                          "Latest updates",
                          const NewsListScreen(),
                        ),
                        _buildFeatureCard(
                          context,
                          Icons.shopping_bag_outlined,
                          "Store",
                          "Buy products",
                          const MyProduct(),
                        ),
                        _buildUtilityCard(context),
                        _buildFeatureCard(
                          context,
                          Icons.support_agent,
                          "Support",
                          "Contact AI",
                          null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const AppTextField(hint: "Search anything...", icon: Icons.search),
                    const SizedBox(height: 50), // Khoảng trống dưới cùng
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    IconData icon,
    String title,
    String sub,
    Widget? page,
  ) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Feature coming soon!")),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kTopColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: kDarkColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  sub,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: kGreyColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUtilityCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (ctx) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50, height: 5,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Utilities",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kDarkColor),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.calculate, color: kDarkColor),
                  title: const Text("Counter Tool"),
                  onTap: () {
                    Navigator.pop(ctx);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CounterScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.color_lens, color: kDarkColor),
                  title: const Text("Color Changer"),
                  onTap: () {
                    Navigator.pop(ctx);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangeColorScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback, color: kDarkColor),
                  title: const Text("Send Feedback"),
                  onTap: () {
                    Navigator.pop(ctx);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedbackScreen()));
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kTopColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.widgets_outlined, size: 24, color: kDarkColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Utilities",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Tools & Extras",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: kGreyColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}