import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent_app_ui/ui/colors/custom_colors.dart';
import 'package:home_rent_app_ui/ui/home/home_mixin.dart';
import 'package:home_rent_app_ui/ui/home/widget/img_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            appBar(),
            const SizedBox(height: 36),
            searchRow(),
            const SizedBox(height: 20),
            rowOfButtons(),
            const SizedBox(height: 20),
            horizontalListHeader(),
            const SizedBox(height: 10),
            horizontalList(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Localizaçâo",
                style: TextStyle(
                  color: CustomColors.figGrey,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Pelotas",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset("assets/IC_Notification.svg"),
        ],
      ),
    );
  }

  Widget searchRow() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 15,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Search address, or near you",
              hintStyle: TextStyle(
                fontSize: 12,
                color: CustomColors.figGrey,
              ),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: CustomColors.black,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
              shape: const RoundedRectangleBorder(),
            ),
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/IC_Filter.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget rowOfButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton("Casa"),
          buildButton("Apartamento"),
          buildButton("Hotel"),
          buildButton("Pousada"),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: activeButton == text
                ? [CustomColors.figLigthBlue, CustomColors.figBlue]
                : [CustomColors.white, CustomColors.white],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            setState(() {
              activeButton = text;
            });
          },
          child: Text(
            text,
            style: TextStyle(
              color: activeButton == text
                  ? CustomColors.white
                  : CustomColors.figGrey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget horizontalListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Perto de Você",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Ver tudo",
            style: TextStyle(
              color: CustomColors.figGrey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget horizontalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        child: Row(
          children: [
            ImageContainer(img: "assets/Image.png"),
            ImageContainer(img: "assets/Image.png"),
            ImageContainer(img: "assets/Image.png"),
          ],
        ),
      ),
    );
  }
}
