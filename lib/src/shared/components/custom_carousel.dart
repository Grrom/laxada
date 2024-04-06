import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:products_app/core/utils/colors.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> items;
  final bool autoPlay;
  final bool infiniteScroll;
  final double? height;
  final double aspectRatio;
  final double viewportFraction;
  final int initialPage;
  final CarouselController? controller;

  const CustomCarousel({
    required this.items,
    this.height,
    this.aspectRatio = 2,
    this.viewportFraction = .8,
    this.autoPlay = true,
    this.infiniteScroll = true,
    this.initialPage = 0,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomCarouselState();
  }
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _current = 0;
  CarouselController _controller = CarouselController();

  @override
  void initState() {
    _current = widget.initialPage;
    if (widget.controller != null) {
      _controller = widget.controller!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: widget.items,
            carouselController: _controller,
            options: CarouselOptions(
              initialPage: widget.initialPage,
              viewportFraction: widget.viewportFraction,
              autoPlay: widget.autoPlay,
              enableInfiniteScroll: widget.infiniteScroll,
              aspectRatio: widget.aspectRatio,
              height: widget.height,
              onPageChanged: (index, reason) {
                setState(() => _current = index);
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: MediaQuery.of(context).size.width /
                        (widget.items.length + 1),
                    height: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                      color: _current == entry.key
                          ? Colors.grey
                          : CustomColors.lightGrey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
