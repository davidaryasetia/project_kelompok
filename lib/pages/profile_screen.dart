import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_kelompok/utils/mytheme.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Mytheme.appBarColor));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Mytheme.appBarColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(60)
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: picUrl,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFE4EDFF),
                            ),
                            child: Icon(Icons.person_outline,
                              color: Color(0xFF4C7EFF),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Email"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFE4EDFF),
                            ),
                            child: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFFCC80EA),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Mobile"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFE4EDFF),
                            ),
                            child: const Icon(
                              Icons.phone_android_outlined,
                              color: Color(0xFF4C7EFF),
                            ),
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){},
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Color(0xFF4C7EFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
            ),
              ),
            ),
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width * 0.5 + 30,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Mytheme.appBarColor,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
