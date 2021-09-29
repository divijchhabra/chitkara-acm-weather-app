import 'package:flutter/material.dart';
import 'package:clima/screens/SearchScreen.dart';
import 'package:clima/models/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city = "", temp = "", description = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.weatherData);
  }

  updateUi(var data) {
    if (data != null) {
      temp = data['main']['temp'].toString();
      city = data['name'];
      description = data['weather'][0]['description'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/city_background.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      updateUi(widget.weatherData);
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 50,
                    )),
                GestureDetector(
                    onTap: () async {
                      String enteredCity = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                      WeatherModel model = WeatherModel();
                      
                      if(enteredCity!=null){
                        var data = await model.getCityWeather(enteredCity);
                        updateUi(data);
                      }


                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 50,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Current Temperature : ',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Center(
                  child: Text(
                    temp,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            Text('There\'s $description in $city',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Column(
              children: [
                Text('Temperature In  Mumbai : '),
                Text('Temperature In  Agra : '),
                Text('Temperature In  Mohali : '),
              ],
            )
          ],
        ),
      ),
    );
  }
}
