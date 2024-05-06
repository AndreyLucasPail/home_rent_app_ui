import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_app_ui/ui/colors/custom_colors.dart';
import 'package:home_rent_app_ui/ui/house_screen/house_mixin.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({
    super.key,
    required this.house,
  });

  final Map<String, dynamic> house;

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> with HouseMixin {
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
            const SizedBox(height: 30),
            ownerCard(),
            const SizedBox(height: 30),
            gallery(),
            const SizedBox(height: 30),
            local(),
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
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/jurica-koletic.png"),
          backgroundColor: CustomColors.figGrey,
        ),
        const SizedBox(width: 10),
        const Column(
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
        const Spacer(),
        SizedBox(
          height: 40,
          width: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: CustomColors.figLigthBlue2.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.phone,
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 40,
          width: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: CustomColors.figLigthBlue2.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.message,
            ),
          ),
        ),
      ],
    );
  }

  Widget gallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Galeria",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: interiorImg.map((img) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget local() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/maps.png"),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Preço",
                    style: TextStyle(
                      color: CustomColors.figGrey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${widget.house["price"].toStringAsFixed(3)} /Mês",
                    style: const TextStyle(
                      color: CustomColors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 130),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      CustomColors.figLigthBlue,
                      CustomColors.figBlue,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Alugar",
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
