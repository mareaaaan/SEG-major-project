import 'dart:convert';

import 'package:cycle/models/named_lat_lng.dart';
import 'package:cycle/services/data_managers/routing_api_provider.dart';
import 'package:cycle/services/my_route.dart';
import 'package:cycle/services/network_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  MyRoute myRoute = MyRoute();
  setUpMyRoute(myRoute);

  test("Testing simple case for the RoutingApiProvider with correct response",
      () async {
    final routingApiProvider = RoutingApiProvider();
    NetworkHelper.client = MockClient((request) async {
      final mockJson = [
        [-0.111985, 51.505482],
        [-0.111343, 51.50572]
      ];
      return Response(json.encode(mockJson), 200);
    });
    final routeCoordinates = await routingApiProvider.getCoordinates(myRoute);
    expect(routeCoordinates.coordinatesList.length, 2);
    expect(routeCoordinates.coordinatesList[0], [-0.111985, 51.505482]);
    expect(routeCoordinates.coordinatesList[1], [-0.111343, 51.50572]);
  });

  test("Testing the RoutingApiProvider with correct response", () async {
    final routingApiProvider = RoutingApiProvider();
    NetworkHelper.client = MockClient((request) async {
      final mockJson = [
        [-0.111985, 51.505482],
        [-0.111343, 51.50572],
        [-0.112129, 51.50674],
        [-0.1087, 51.507764],
        [-0.104489, 51.50814],
        [-0.10432, 51.511926],
        [-0.104305, 51.512515],
        [-0.105865, 51.512541],
        [-0.106155, 51.513573],
        [-0.106603, 51.516606],
        [-0.105986, 51.518341],
        [-0.105324, 51.518542],
        [-0.105679, 51.519741],
        [-0.106227, 51.519612],
        [-0.108958, 51.523013],
        [-0.109957, 51.523131],
        [-0.109499, 51.52418],
        [-0.109969, 51.524546],
        [-0.109384, 51.524891],
        [-0.111641, 51.527032],
        [-0.109858, 51.528041],
        [-0.111543, 51.533975],
        [-0.110403, 51.538593],
        [-0.109275, 51.540227],
        [-0.110926, 51.543712],
        [-0.1104, 51.543832],
        [-0.113026, 51.546762],
        [-0.107106, 51.54939],
        [-0.108881, 51.551053],
        [-0.110619, 51.554103],
        [-0.109914, 51.555402]
      ];
      return Response(json.encode(mockJson), 200);
    });
    final routeCoordinates = await routingApiProvider.getCoordinates(myRoute);
    expect(routeCoordinates.coordinatesList.length, 31);
    expect(routeCoordinates.coordinatesList[0], [-0.111985, 51.505482]);
    expect(routeCoordinates.coordinatesList[1], [-0.111343, 51.50572]);
    expect(routeCoordinates.coordinatesList[14], [-0.108958, 51.523013]);
    expect(routeCoordinates.coordinatesList[30], [-0.109914, 51.555402]);
  });

  test("Testing the RoutingApiProvider with different status code", () async {
    //setup the test
    final routingApiProvider = RoutingApiProvider();
    NetworkHelper.client = MockClient((request) async {
      final mockJson = [];
      return Response(json.encode(mockJson), 404);
    });
    final routeCoordinates = await routingApiProvider.getCoordinates(myRoute);
    expect(routeCoordinates.coordinatesList.first.length, 0);
  });
}

void setUpMyRoute(MyRoute myRoute) {
  myRoute.startingLocation =
      NamedLatLng(latitude: 0.0, longitude: 0.0, name: 'start');
  myRoute.finishingLocation =
      NamedLatLng(latitude: 1.0, longitude: 1.0, name: 'finish');
}
