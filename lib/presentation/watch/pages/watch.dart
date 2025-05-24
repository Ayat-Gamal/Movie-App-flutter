import 'package:flutter/material.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

import '../widgets/video_title.dart';

class Watch extends StatelessWidget {
  final MovieEntity movieEntity;

  Watch({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id),
            SizedBox(height: 16),
            VideoTitle(title: movieEntity.title),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReleaseDate(releaseDate: movieEntity.releaseDate),
                VideoVoteAverage(voteAvg: movieEntity.voteAverage),
              ],
            ),
            SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview),
            SizedBox(height: 24),
            RecommendationMovies(movieId: movieEntity.id),
            SizedBox(height: 16),
            SimilarMovies(movieId: movieEntity.id),
          ],
        ),
      ),
    );
  }
}
