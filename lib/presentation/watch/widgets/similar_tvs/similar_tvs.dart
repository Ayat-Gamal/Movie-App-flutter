import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/generic_data_bloc/data_cubit.dart';
import 'package:movie_app/common/widget/movie/movie_card.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import '../../../../common/widget/tv/tv_card.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../domain/tv/usecase/get_similar_tvs.dart';
import '../../../../service_locator.dart';

class SimilarTVs extends StatelessWidget {
  final int? tvId;

  const SimilarTVs({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DataCubit()..getData<List<KeywordEntity>>(
                sl<GetSimilarTVsUseCase>(),
                params: tvId,
              ),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading && tvId != null) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar Shows',
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
