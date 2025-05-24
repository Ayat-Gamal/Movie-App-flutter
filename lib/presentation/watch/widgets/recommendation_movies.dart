import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widget/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movies_cubit/recommendation_cubit.dart';

import '../../../core/config/theme/app_colors.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;

  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RecommendationCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationCubit, RecommendationState>(
        builder: (context, state) {
          if (state is RecommendationLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is RecommendationLoaded) {
            return Column(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Recommendations',
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.primary
              ),
              ),
                SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                 //   padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadRecommendation) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
