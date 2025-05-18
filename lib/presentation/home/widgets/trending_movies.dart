import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
          builder: (context,state){
            if(state is TrendingMoviesLoading){
              return Center(child: CircularProgressIndicator());
            }

            if(state is TrendingMoviesLoaded){
              return FanCarouselImageSlider.sliderType1(
                  imagesLink: state.movies.map((item)=> AppImages.movieImageBasePath + item.posterPath.toString()).toList(),
                  isAssets: false,
                sliderHeight: 400,
                sliderWidth: 350,
                showIndicator: false,
               );
            }
            if(state is FailureLoadTrendingMovies){
              return Text(state.errorMessage);
            }
            return Container();
          }


      ),
    );
  }
}
