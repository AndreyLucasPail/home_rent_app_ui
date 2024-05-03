import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent_app_ui/ui/colors/custom_colors.dart';

class HouseTile extends StatelessWidget {
  const HouseTile({
    super.key,
    required this.houses,
  });

  final Map<String, dynamic> houses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  houses["img"],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                houses["houseName"],
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${houses["price"].toStringAsFixed(3)} R\$ / Mês",
                style: const TextStyle(
                  color: CustomColors.figBlue,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/IC_Bed.svg"),
                  const SizedBox(width: 6),
                  Text("${houses["bedRooms"]} Quartos"),
                  const SizedBox(width: 16),
                  SvgPicture.asset("assets/IC_Bath.svg"),
                  const SizedBox(width: 6),
                  Text("${houses["bedRooms"]} Banheiros"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
