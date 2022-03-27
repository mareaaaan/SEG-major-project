import 'package:cycle/models/docking_station.dart';
import 'package:cycle/models/landmark.dart';
import 'package:cycle/services/network_helper.dart';

const String kBackEndUrl = 'https://agile-citadel-13372.herokuapp.com/';

const String kBikePointsPath = 'bikepoints/?format=json';
const String kLandmarksPath = 'landmarks/?format=json';

Future<List<DockingStation>> getDockingStations() async {
  NetworkHelper networkHelper = NetworkHelper(kBackEndUrl + kBikePointsPath);

  List<DockingStation> dockingStations =
      (await networkHelper.getDataAsJsonList())
          .map((dockingStation) => DockingStation.fromJson(dockingStation))
          .toList();

  return dockingStations;
}

Future<List<Landmark>> getLandmarks() async {
  NetworkHelper networkHelper = NetworkHelper(kBackEndUrl + kLandmarksPath);

  List<Landmark> landmarks = (await networkHelper.getDataAsJsonList())
      .map((landmark) => Landmark.fromJson(landmark))
      .toList();

  return landmarks;
}
