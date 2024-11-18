import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/address_model.dart';

class LocationService {
  // Função para pedir permissão de localização
  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  // Função para obter a localização atual
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // Função para buscar endereço pelo CEP usando a API ViaCEP
  Future<Address> fetchAddressByZipCode(String zipCode) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$zipCode/json/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Address.fromJson(data);
    } else {
      throw Exception('Erro ao buscar o endereço com o CEP $zipCode');
    }
  }
}
