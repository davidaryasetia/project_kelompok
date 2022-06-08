import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_kelompok/utils/dummy_data.dart';
import 'package:project_kelompok/utils/mytheme.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i){
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 10.0, right: 20),
            child: GestureDetector(
              onTap: (){
                print(movies[i].title);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      movies[i].bannerUrl,
                      height: 150,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      movies[i].title,
                      style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Mytheme.splash,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${movies[i].like}%",
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
