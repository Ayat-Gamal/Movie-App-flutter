import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widget/movie/movie_card.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import 'package:movie_app/domain/moive/usecases/get_recommendation_movies.dart';
import '../../../../common/generic_data_bloc/data_cubit.dart';
import '../../../../common/widget/tv/tv_card.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../domain/tv/usecase/get_recommendation_tvs.dart';
import '../../../../service_locator.dart';


class RecommendationTVs extends StatelessWidget {
  final int? tvId;

  const RecommendationTVs({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DataCubit()..getData<List<KeywordEntity>>(
                sl<GetRecommendationTVsUseCase>(),
                params: tvId,
              ),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded && tvId != null) {

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TVCard(tvEntity: state.dataList[index]);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.dataList.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
