import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import '../../models/weather_details_model.dart';
import '../../screens/utils/constant.dart';

part 'get_weather_details_state.dart';

class GetWeatherDetailsCubit extends Cubit<GetWeatherDetailsState> {
  GetWeatherDetailsCubit() : super(GetWeatherDetailsInitial());

  Future<void> getWeatherDetails() async {
    try {
      emit(GetWeatherDetailsLoading());
      var url = Uri.parse(
          "https://api.openweathermap.org/data/3.0/onecall?lat=1.332359766395726&lon=103.89207915696818&exclude=minutely,hourly,alerts&units=metric&appid=${AppConstants
              .apiKey}");
      var response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      WeatherDetailsModel details = WeatherDetailsModel.fromJson(data);
      emit(GetWeatherDetailsLoaded(details: details));
    } catch (e) {
      print("Error  $e");
      emit(GetWeatherDetailsFailed());
    }
  }
}
