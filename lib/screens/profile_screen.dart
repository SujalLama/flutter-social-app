import 'package:flutter/material.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/widgets/custom_drawer.dart';
import 'package:social_app/widgets/posts_carousel.dart';
import 'package:social_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _yourPostsPageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  final PageController _favoritesPageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300.0,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Theme.of(context).primaryColor,
                    iconSize: 30.0,
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(widget.user.profileImageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.user.name ?? '',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts ?? [],
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites ?? [],
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
