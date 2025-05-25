import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/domain/moive/usecases/get_trending_movie.dart';

import '../../../common/generic_data_bloc/data_cubit.dart';
import '../../../service_locator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit()..getData(sl<GetTrendingMovieUseCase>()),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.dataList
                      .map(
                        (item) =>
                            AppImages.movieImageBasePath +
                            item.posterPath.toString(),
                      )
                      .toList(),
              isAssets: false,
              sliderHeight: 400,
              sliderWidth: 350,
              showIndicator: false,
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
