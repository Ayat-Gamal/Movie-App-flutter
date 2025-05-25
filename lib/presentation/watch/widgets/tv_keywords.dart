import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/domain/moive/usecases/get_keywords.dart';

import '../../../common/generic_data_bloc/data_cubit.dart';
import '../../../core/entities/keyword_entity.dart';
import '../../../service_locator.dart';

class TvKeywords extends StatelessWidget {
  final int tvId;

  const TvKeywords({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DataCubit()..getData<List<KeywordEntity>>(
                sl<GetTVKeywordsUseCase>(),
                params: tvId,
              ),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            List keywords = state.dataList;
            return Wrap(
              spacing: 5,
              children:
                  keywords
                      .map(
                        (item) => Chip(
                          backgroundColor: AppColors.primary,
                          labelStyle: TextStyle(color: AppColors.bagie),
                          label: Text(item.name!),
                        ),
                      )
                      .toList(),
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
