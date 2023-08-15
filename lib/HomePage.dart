import 'package:bike_animation_app/BikeModel.dart';
import 'package:bike_animation_app/widgets/bike_info_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'SwipeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bikeList = [
    BikeModel(
        "DESERTX",
        "110 hp (81 kW)",
        "92 Nm @ 6500 rpm",
        "202 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/SH02gdny9igmzmJDkEtj7/d2416c646de79ca94496414a90a19fdd/MY-22-DesertX-Model-Blocks-630x390.png",
        0xffE5E5E6),
    BikeModel(
        "DIAVEL V4",
        "168 hp (124 kW)",
        "126 Nm @ 7500 rpm",
        "211 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/11dIwaMlFQXwUBAUHkEOya/d391bf181d0e272b2d7d53d2d7a36b02/MY23-Diavel-V4-Rd-Model-Blocks-630x390.png",
        0xffD81500),
    BikeModel(
        "XDIAVEL",
        "166 hp (124 kW)",
        "124 Nm @ 7500 rpm",
        "205 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/6zHZhPjMUdm0W86FGUWeuP/b3d1c59dadec04599fb7751051432c8a/MY-22-XDVL-Nera-Model-Blocks-630x390.png",
        0xff616468),
    BikeModel(
        "HYPERMOTARD",
        "155 hp (124 kW)",
        "115 Nm @ 7500 rpm",
        "169 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/3Lvhk6I5EknNRTkzEgWFS4/19750747e1cc25903fc7fcacf9b0917d/MY23-Hypermotard-950-RVE-Model-Blocks-630x390.png",
        0xffB20F19),
    BikeModel(
        "MONSTER",
        "166 hp (124 kW)",
        "120 Nm @ 7500 rpm",
        "170 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/3ZNvWGIPIPh0uT2HlmMmQu/374b218cbfd9baaa3d007cb050e7f53c/MY23-Monster-30-Anniversario-Model-Blocks-630x390.png",
        0xff003E35),
    BikeModel(
        "STREETFIGHTER",
        "180 hp (124 kW)",
        "135 Nm @ 7500 rpm",
        "184 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/75SEQJtLwUcenTM5Z78sdF/73801fae4c7b669509fef5d882cfd1b0/MY-22-SF-V2-Model-Blocks-630x390-v06.png",
        0xff929292),
    BikeModel(
        "MULTISTRADA",
        "175 hp (124 kW)",
        "133 Nm @ 7500 rpm",
        "180 Kg",
        "12 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/Og3RwLG7uLAN6lDHo5OxQ/6d14798e070edbdb21deac1dbccecb6c/MY23-Multistrada-V4-Rally-Radar-Gr-Model-Blocks-630x390.png",
        0xff2C2C2C),
    BikeModel(
        "PANIGALE",
        "180 hp (124 kW)",
        "145 Nm @ 7500 rpm",
        "220 Kg",
        "14 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/6EOMax3Cyd6Ina9UUe1YgS/27a82eda817cf7bfc218d60a93900e66/MY23-Panigale-V2-Bk-Model-Blocks-630x390.png",
        0xff4C4D4F),
    BikeModel(
        "SUPERSPORT",
        "200 hp (124 kW)",
        "165 Nm @ 7500 rpm",
        "245 Kg",
        "14 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/o4acSOtyiTvYp8OgtED6S/18aef294b65b8dc716d8dfb4c924ff40/MY23-Supersport-950-S-DS-Model-Blocks-630x390.png",
        0xffC7CAD0),
    BikeModel(
        "SCRAMBLER",
        "145 hp (124 kW)",
        "124 Nm @ 7500 rpm",
        "165 Kg",
        "14 L",
        "5.2 Km/L",
        "N/A",
        "European",
        "https://images.ctfassets.net/x7j9qwvpvr5s/5kay6kokLPWtD9bl5MrLXA/d65156089ef9250280de6362b24463b0/MY23-SCR-Icon-Y-Model-Blocks-630x390.png",
        0xffEBDB1E)
  ];
  int activeIndex = 0;
  final PageController _pageController = PageController();
  bool fromBack = false;

  @override
  Widget build(BuildContext context) {

    var themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Color(bikeList[activeIndex].Color)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               color: const Color.fromARGB(255, 255, 255, 255),
               margin: const EdgeInsets.symmetric(vertical: 24),
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               child: Text(
                 "Dukati Bike Collection",
                 style: themeData.textTheme.bodyMedium!.copyWith(
                   fontWeight: FontWeight.bold,
                   fontSize: 18,
                   color: Colors.black45,
                 ),
               ),
             ),
             SizedBox(
               height: 450,
               width: double.maxFinite,
               child: Swiper(
                 onIndexChanged: (value) {
                   if (value > activeIndex) {
                     _pageController.nextPage(
                         duration: 400.ms, curve: Curves.decelerate);
                     fromBack = false;
                   }
                   if (value < activeIndex) {
                     _pageController.previousPage(
                         duration: 400.ms, curve: Curves.decelerate);
                     fromBack = true;
                   }
                   activeIndex = value;
                   setState(() {});
                 },
                 itemBuilder: (BuildContext context, int index) {
                   return SwipeCard(
                     power: bikeList[index].power,
                     isActive: activeIndex == index,
                     fromBack: fromBack,
                     title: bikeList[index].name,
                     image: bikeList[index].Image,
                   );
                 },
                 itemCount: bikeList.length,
                 loop: false,
                 index: 0,
                 itemWidth: 324.0,
                 itemHeight: 420,
                 layout: SwiperLayout.STACK,
                 physics: const BouncingScrollPhysics(),
               ),
             ),
             SizedBox(
               height: 190,
               child: PageView.builder(
                 itemCount: bikeList.length,
                 controller: _pageController,
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   return CardInfoWidget(name: bikeList[index].name, power: bikeList[index].power, torque: bikeList[index].torque, dryWeight: bikeList[index].dryWeight, fuel: bikeList[index].fuel, consumption: bikeList[index].consumption, co2: "N/A", standard: bikeList[index].standard,);
                 },
               ),
             )
           ],
          ),
        ),
      ),
    );
  }
}
