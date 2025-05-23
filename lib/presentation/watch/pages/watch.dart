import 'package:flutter/material.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';

class Watch extends StatelessWidget {
  final MovieEntity movieEntity;

  Watch({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
            hideBack: false
        ),
      body: VideoPlayer(id: movieEntity.id),
    );
  }
}
