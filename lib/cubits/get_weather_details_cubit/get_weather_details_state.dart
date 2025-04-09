part of 'get_weather_details_cubit.dart';

sealed class GetWeatherDetailsState extends Equatable {
  const GetWeatherDetailsState();
}

final class GetWeatherDetailsInitial extends GetWeatherDetailsState {
  @override
  List<Object> get props => [];
}
final class GetWeatherDetailsLoading extends GetWeatherDetailsState {
  @override
  List<Object> get props => [];
}
final class GetWeatherDetailsLoaded extends GetWeatherDetailsState {
  const GetWeatherDetailsLoaded({required this.details});
  final WeatherDetailsModel details;
  @override
  List<Object> get props => [details];
}
final class GetWeatherDetailsFailed extends GetWeatherDetailsState {
  @override
  List<Object> get props => [];
}
