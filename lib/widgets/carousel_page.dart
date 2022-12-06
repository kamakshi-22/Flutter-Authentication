import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final urlImages = [
    'https://journalsofindia.com/wp-content/uploads/2020/11/All-India-Council-for-Technical-Education-AICTE.jpg',
    'https://www.aicte-india.org/sites/default/files/styles/slideshow__760x400_/public/images/our_campus/Homepage_Bureas_RIFD.JPG?itok=N0NVqUnX',
    'https://bl-i.thgim.com/public/incoming/3ol5d8/article65667158.ece/alternates/FREE_1200/WhatsApp%20Image%202022-07-21%20at%207.35.16%20PM.jpeg',
    'https://www.mapsofindia.com/ci-moi-images/my-india/2022/09/IMG-20220927-WA0011.jpg',
    'http://www.aicte-india.org/sites/default/files/160817_gallery_01.jpg',
    'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-85c69s0g72j2titen4ev0242t6-20170412161430.Medi.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(height: 200),
      itemCount: urlImages.length,
      itemBuilder: (context, index, realIndex) {
        final urlImage = urlImages[index];
        return buildImage(urlImage, index);
      },
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        //color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover
        ),
      );
}
