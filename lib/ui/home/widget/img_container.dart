import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent_app_ui/ui/colors/custom_colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.housesData,
  });

  final Map<String, dynamic> housesData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.34,
            decoration: BoxDecoration(
              color: CustomColors.black,
              image: DecorationImage(
                opacity: 0.8,
                image: AssetImage(housesData["img"]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: CustomColors.figGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/IC_Location.svg"),
                  const SizedBox(width: 6),
                  Text(
                    housesData["distance"],
                    style: const TextStyle(
                      color: CustomColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  housesData["houseName"],
                  style: const TextStyle(
                    color: CustomColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  housesData["houseAddress"],
                  style: const TextStyle(
                    color: CustomColors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
