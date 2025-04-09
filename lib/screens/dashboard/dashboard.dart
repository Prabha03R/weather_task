import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/cubits/get_weather_details_cubit/get_weather_details_cubit.dart';

import '../../models/weather_details_model.dart';
import '../weather_details/weather_details.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  String formatWeatherDate(int timestampInSeconds) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
    DateTime now = DateTime.now();

    bool isToday = date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
    if (isToday) {
      return "Today";
    }else{
      return DateFormat('EEE, MMM d, yyyy h:mm a').format(date);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: const Text("Weather App",style: TextStyle(color: Colors.white),),
      ),
      body: BlocBuilder<GetWeatherDetailsCubit, GetWeatherDetailsState>(
        builder: (context, state) {
          if(state is GetWeatherDetailsLoaded){
            WeatherDetailsModel data=state.details;

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12),
              itemCount: data.daily?.length,
              itemBuilder: (context, index) {
                Daily? item = data.daily?[index];
                return InkWell(
                  onTap: () {
                    if(item!=null){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WeatherDetailScreen(icon: item.weather?.first.main=="Rain"?"🌧️":item.weather?.first.main=="Clear"?"🌤️":item.weather?.first.main=="Clouds"?"☁️":"☁️" ,dailyData: item,),));
                    }
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: Text(
                        item?.weather?.first.main=="Rain"?"🌧️":item?.weather?.first.main=="Clear"?"🌤️":item?.weather?.first.main=="Clouds"?"☁️":"☁️",
                        style: const TextStyle(fontSize: 30),
                      ),
                      title: Text(
                        formatWeatherDate(item?.dt??00),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item?.weather?.first.main}",style: Theme.of(context).textTheme.bodyMedium?.apply(fontSizeDelta: 1,fontWeightDelta: 1),),
                          Text('Temp : Min  ${item?.temp?.min} °C , Max  ${item?.temp?.max} °C'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else if(state is GetWeatherDetailsLoading){
            return Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            );
          }else if(state is GetWeatherDetailsFailed){
            return Center(
              child: Text("No Record Found"),
            );
          }else{
            return SizedBox();
          }

        },
      ),
    );
  }
}