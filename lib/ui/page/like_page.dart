import 'dart:math';
import 'package:booking/core/sqlite_service.dart';
import 'package:booking/features/home/models/favorites.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/home_list.dart';
import 'package:booking/ui/widget/like/like_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final dbHelper = DatabaseHelper();
  late List<Favorite> hotels;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    hotels = [];
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await dbHelper.getFavorites();
    setState(() {
      hotels = favorites;
    });
  }

  Future<void> _toggleFavorite(Favorite hotel) async {
    if (await dbHelper.isFavoriteById(hotel.hotelId)) {
      await dbHelper.deleteFavorite(hotel.hotelId);
    } else {
      await dbHelper.addFavorite(hotel);
    }
    _loadFavorites();
  }

  Future<void> _refresh() async {
    await _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            onTap: () => {context.pop()},
          )
        ],
        elevation: 0,
        title: const Text(
          'Избранное',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(47, 47, 47, 1),
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: grayLightButton,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
            child: FutureBuilder<List<Favorite>>(
          future: dbHelper.getFavorites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Container(
                alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 60),
                  child: Text('Избранное не найдено'));
            } else {
              return LikeList(
                count: snapshot.data!.length,
                favorites: snapshot.data!,
                toggle: (p0) {
                  _toggleFavorite(p0);
                },
              );
            }
          },
        )),
      ),
    );
  }
}
