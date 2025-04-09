import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/weather_details_model.dart';
class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key,required this.dailyData,required this.icon});
  final Daily dailyData;

  final String icon;
  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {

  String timeFormat(int timestampInSeconds) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
    return DateFormat('h:mm a').format(date);
  }
  String dateFormat(int timestampInSeconds) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);
    return DateFormat('EEE, MMM d, yyyy').format(date);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Weather Details",style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              dateFormat(widget.dailyData.dt??0),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              timeFormat(widget.dailyData.dt??0),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.dailyData.temp?.night.toString()??''} °C",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.icon,
                  style: const TextStyle(fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "${widget.dailyData.weather?.first.main} ( ${widget.dailyData.weather?.first.description} )",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Temp (min)'),
                    Text(
                      "${widget.dailyData.temp?.min.toString()??''} °C",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text('Temp (max)'),
                    Text(
                      "${widget.dailyData.temp?.max.toString()??''} °C",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}