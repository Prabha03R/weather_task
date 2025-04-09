class WeatherDetailsModel {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Minutely>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherDetailsModel(
      {this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.minutely,
        this.hourly,
        this.daily});

  WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    if (json['minutely'] != null) {
      minutely = <Minutely>[];
      json['minutely'].forEach((v) {
        minutely!.add(Minutely.fromJson(v));
      });
    }
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.minutely != null) {
      data['minutely'] = this.minutely!.map((v) => v.toJson()).toList();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = _toDouble(json['temp']);
    feelsLike = _toDouble(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = _toDouble(json['dew_point']);
    uvi = _toDouble(json['uvi']);
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = _toDouble(json['wind_speed']);
    windDeg = json['wind_deg'];
    windGust = _toDouble(json['wind_gust']);

    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;

    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Helper to safely convert any number to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return double.tryParse(value.toString());
  }
}


class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Minutely {
  int? dt;
  int? precipitation;

  Minutely({this.dt, this.precipitation});

  Minutely.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    precipitation = json['precipitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['precipitation'] = precipitation;
    return data;
  }
}

class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  double? pressure;
  double? humidity;
  double? dewPoint;
  double? uvi;
  double? clouds;
  double? visibility;
  double? windSpeed;
  double? windDeg;
  double? windGust;
  List<Weather>? weather;
  double? pop;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? double.parse(json['temp'].toString()) : null;
    feelsLike = json['feels_like'] != null ? double.parse(json['feels_like'].toString()) : null;
    pressure = json['pressure'] != null ? double.parse(json['pressure'].toString()) : null;
    humidity = json['humidity'] != null ? double.parse(json['humidity'].toString()) : null;
    dewPoint = json['dew_point'] != null ? double.parse(json['dew_point'].toString()) : null;
    uvi = json['uvi'] != null ? double.parse(json['uvi'].toString()) : null;
    clouds = json['clouds'] != null ? double.parse(json['clouds'].toString()) : null;
    visibility = json['visibility'] != null ? double.parse(json['visibility'].toString()) : null;
    windSpeed = json['wind_speed'] != null ? double.parse(json['wind_speed'].toString()) : null;
    windDeg = json['wind_deg'] != null ? double.parse(json['wind_deg'].toString()) : null;
    windGust = json['wind_gust'] != null ? double.parse(json['wind_gust'].toString()) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    pop = json['pop'] != null ? double.parse(json['pop'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dt'] = dt;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['pop'] = pop;
    return data;
  }
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  String? summary;
  Temp? temp;
  FeelsLike? feelsLike;
  double? pressure;
  double? humidity;
  double? dewPoint;
  double? windSpeed;
  double? windDeg;
  double? windGust;
  List<Weather>? weather;
  double? clouds;
  double? pop;
  double? uvi;
  double? rain;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'] != null ? double.parse(json['moon_phase'].toString()) : null;
    summary = json['summary'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like']) : null;
    pressure = json['pressure'] != null ? double.parse(json['pressure'].toString()) : null;
    humidity = json['humidity'] != null ? double.parse(json['humidity'].toString()) : null;
    dewPoint = json['dew_point'] != null ? double.parse(json['dew_point'].toString()) : null;
    windSpeed = json['wind_speed'] != null ? double.parse(json['wind_speed'].toString()) : null;
    windDeg = json['wind_deg'] != null ? double.parse(json['wind_deg'].toString()) : null;
    windGust = json['wind_gust'] != null ? double.parse(json['wind_gust'].toString()) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? double.parse(json['clouds'].toString()) : null;
    pop = json['pop'] != null ? double.parse(json['pop'].toString()) : null;
    uvi = json['uvi'] != null ? double.parse(json['uvi'].toString()) : null;
    rain = json['rain'] != null ? double.parse(json['rain'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['summary'] = summary;
    if (temp != null) data['temp'] = temp!.toJson();
    if (feelsLike != null) data['feels_like'] = feelsLike!.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['uvi'] = uvi;
    data['rain'] = rain;
    return data;
  }
}


class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? double.parse(json['day'].toString()) : null;
    min = json['min'] != null ? double.parse(json['min'].toString()) : null;
    max = json['max'] != null ? double.parse(json['max'].toString()) : null;
    night = json['night'] != null ? double.parse(json['night'].toString()) : null;
    eve = json['eve'] != null ? double.parse(json['eve'].toString()) : null;
    morn = json['morn'] != null ? double.parse(json['morn'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}


class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? double.parse(json['day'].toString()) : null;
    night = json['night'] != null ? double.parse(json['night'].toString()) : null;
    eve = json['eve'] != null ? double.parse(json['eve'].toString()) : null;
    morn = json['morn'] != null ? double.parse(json['morn'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

