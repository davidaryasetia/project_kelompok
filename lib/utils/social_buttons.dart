import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_kelompok/utils/mytheme.dart';


class SocialLoginButtons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFbClick;
  const SocialLoginButtons({Key? key, required this.onFbClick, required this.onGoogleClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Material(
              color: Mytheme.redLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Mytheme.redBorder, width: 0.2),
              ),
              child: InkWell(
                onTap: onGoogleClick,
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5 ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/google.svg"),
                      const SizedBox(
                        width: 8,
                      ),
                    const Text(
                        "Google",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    ],
                 ),
                ),
              ),
            )
        ),

        SizedBox(
          width: 10,
        ),

        Expanded(
            child: Material(
              color: Mytheme.blueLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Mytheme.blueBorder, width: 0.2),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5 ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/facebook.svg"),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Facebook"),
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}
