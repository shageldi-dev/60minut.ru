import 'dart:math';

import 'package:booking/core/api_params.dart';
import 'package:booking/features/home/models/detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

typedef void OnPageChanged(int foo);

class ImagePager extends StatelessWidget {
  final List<String> images;
  //final Room roomImage;
  final OnPageChanged onPageChange;
  final PageController controller;
   ImagePager({super.key, required this.images, required this.onPageChange, required this.controller,});

  @override
  Widget build(BuildContext context) {

    return ExpandablePageView.builder(
      itemCount: images.length,
      controller: controller,
      onPageChanged: (page) => {
        onPageChange(page)
      },
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          width: double.infinity,
          height: 250,
          imageUrl:"$IMG_BASE_URL$images",
        //  "https://picsum.photos/250?image=${Random().nextInt(100)}",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => SizedBox(
            width: double.infinity,
            height: 250,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white38,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      },
    );
  }

}
