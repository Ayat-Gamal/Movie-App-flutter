import 'package:flutter/material.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';

import '../../../domain/tv/entities/tv.dart';

class TVCard extends StatelessWidget {
  final TVEntity tvEntity;

  const TVCard({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    AppImages.movieImageBasePath + tvEntity.posterPath!  ,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tvEntity.name?? "TV Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Text(' ${tvEntity.voteAverage?.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 10,
                            color: Colors.white

                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
