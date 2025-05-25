import 'package:flutter/material.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_tvs/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_app/presentation/watch/widgets/similar_tvs/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

import '../../../domain/tv/entities/tv.dart';
import '../widgets/video_title.dart';

class TVWatch extends StatelessWidget {
  final TVEntity tvEntity;

  const TVWatch({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 16),
            TvKeywords(tvId: tvEntity.id!),
            SizedBox(height: 16),
            VideoVoteAverage(voteAvg: tvEntity.voteAverage!),
            SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 24),
            RecommendationTVs(tvId: tvEntity.id),
            SizedBox(height: 16),
            SimilarTVs(tvId: tvEntity.id ),
          ],
        ),
      ),
    );
  }
}
