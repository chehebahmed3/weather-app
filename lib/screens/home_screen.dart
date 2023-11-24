import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_last/bloc/bloc/weather_bloc.dart';
import 'package:weather_last/widgets/circle_color.dart';
import 'package:weather_last/widgets/icon_temperature.dart';
import 'package:weather_last/widgets/icon_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
          width: 180,
          height: 180,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          width: 180,
          height: 180,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          width: 180,
          height: 180,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          width: 180,
          height: 180,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          width: 180,
          height: 180,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          width: 180,
          height: 180,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          width: 180,
          height: 180,
        );

      default:
        return Image.asset(
          'assets/1.png',
          width: 180,
          height: 180,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 1.2 * kToolbarHeight, 15, 20),
        child: Stack(
          children: [
            //this widget is used to set a background decoration color to my app

            const CircleColor(
              colorapp: Color(0xFF448AFF),
              number1: 0,
              number2: -4,
              height: 600,
            ),
            const CircleColor(
              colorapp: Color(0xFF303F9F),
              number1: 4,
              number2: -0.3,
              height: 300,
            ),

            const CircleColor(
              colorapp: Color(0xFF303F9F),
              number1: -4,
              number2: -0.3,
              height: 300,
            ),
            const CircleColor(
              colorapp: Color(0xFF283593),
              number1: -4,
              number2: -0.3,
              height: 300,
            ),
            const CircleColor(
              colorapp: Color(0xFF283593),
              number1: -4,
              number2: -0.3,
              height: 300,
            ),
            //to make a blur effect to my circlecolor use the backdropfilter widget
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent)),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${state.weather.areaName}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Good Morning',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 64,
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/11.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'SunRise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunrise!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/12.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'SunSet',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunset!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${state.weather.temperature!.celsius!.round()}°C',
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${state.weather.weatherMain}',
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  DateFormat('EEEE dd ')
                                      .add_jm()
                                      .format(state.weather.date!),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconTemperature(
                                    image: 'assets/13.png',
                                    text1: 'TempMax',
                                    temperature:
                                        '${state.weather.tempMax!.celsius!.round().toString()}°C'),
                                IconTemperature(
                                    image: 'assets/14.png',
                                    text1: 'SunSet',
                                    temperature:
                                        '${state.weather.tempMin!.celsius!.round().toString()}°C'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
