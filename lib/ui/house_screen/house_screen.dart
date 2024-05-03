import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_app_ui/ui/colors/custom_colors.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({
    super.key,
    required this.house,
  });

  final Map<String, dynamic> house;

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            houseCard(),
            const SizedBox(height: 20),
            description(),
            const SizedBox(height: 20),
            ownerCard(),
          ],
        ),
      ),
    );
  }

  Widget houseCard() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.85,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.house["img"]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: CustomColors.figGrey.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: CustomColors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CustomColors.figGrey.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline_outlined,
                color: CustomColors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.house["houseName"],
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.house["houseAddress"],
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/IC_Bed.svg",
                height: 28,
                width: 28,
                colorFilter: const ColorFilter.mode(
                  CustomColors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "${widget.house["bedRooms"]} Quartos",
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                "assets/IC_Bath.svg",
                height: 28,
                width: 28,
                colorFilter: const ColorFilter.mode(
                  CustomColors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "${widget.house["bedRooms"]} Banheiros",
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Descrição:",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          widget.house["description"],
          maxLines: 4,
          style: const TextStyle(
            color: CustomColors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget ownerCard() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/jurica-koletic.png"),
          backgroundColor: CustomColors.figGrey,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Garry Allen",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Owner",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
