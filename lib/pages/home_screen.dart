import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_kelompok/controllers/auth_controller.dart';
import 'package:project_kelompok/pages/profile_screen.dart';
import 'package:project_kelompok/utils/constants.dart';
import 'package:project_kelompok/utils/custom_slider.dart';
import 'package:project_kelompok/utils/dummy_data.dart';
import 'package:project_kelompok/utils/event_Items.dart';
import 'package:project_kelompok/utils/menu_item.dart';
import 'package:project_kelompok/utils/movies_item.dart';
import 'package:project_kelompok/utils/mytheme.dart';
import '../utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    tilt: 59.440717697143555,
    zoom: 14.4746,
  );


  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Mytheme.statusBar));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: GestureDetector(
                onTap: (){
                  Get.to(const ProfileScreen());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: picUrl,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("David Aryasetia"),
                DropdownButton<String>(
                    value: city,
                    dropdownColor: Mytheme.statusBar,
                  isDense: true,
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(0.7)),
                  items: cities.
                  map(
                          (e) => DropdownMenuItem<String>(
                              value: e,
                            child: Text(e),
                          ),
                  )
                    .toList(),
                  onChanged: (st){
                      setState(() {
                        city = st!;
                      });
                  },
                )
              ],
            ),
          ),
            actions: [
              IconButton(onPressed: (){},
                  icon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              IconButton(onPressed: (){},
                icon: SvgPicture.asset("assets/icons/notification.svg",
                  color: Colors.white,
                ),
              ),
            ],
        ),
      ),

        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(
                    itemCount: 3,
                      itemBuilder: (_, i){
                      return CustomSlider(
                        index: i,
                      );
                     },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                      "SEAT CATEGORY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                MenuItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    "RECOMENDED SEATS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                MoviesItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearby theatres".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text("View All",
                        style: const TextStyle(
                            color: Mytheme.splash
                        ),
                      ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: size.height * 0.2,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller){
                      // _controller.complete(controller);
                    },
                    zoomControlsEnabled: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/spotlights.svg",
                        color: Colors.black.withOpacity(0.20),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Events".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),
                      ),

                      const Spacer(),
                      TextButton(
                      onPressed: (){},
                      child: const Text("View All",
                        style: const TextStyle(
                            color: Mytheme.splash
                        ),
                      ),
                        ),
                    ],
                  ),
                ),
                EventItems(events: events,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/theater_masks.svg.svg",
                        color: Colors.black.withOpacity(0.20),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Plays".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),
                      ),

                      const Spacer(),
                      TextButton(
                        onPressed: (){},
                        child: const Text("View All",
                          style: const TextStyle(
                              color: Mytheme.splash
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                EventItems(
                  events: plays,
                ),

              ],
            ),
          ),
        ),
    ),
  );
  }
}

