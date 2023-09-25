import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_learnings/controller/movies_controller.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  final MoviesController moviesController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${moviesController.movies}",
          ),
        ],
      ),
    );
  }
}
