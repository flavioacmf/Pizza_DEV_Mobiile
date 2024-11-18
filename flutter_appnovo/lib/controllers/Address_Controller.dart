import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/address_model.dart';

class AddressController extends ChangeNotifier {
  Address _address =
      Address(street: '', neighborhood: '', zipCode: '', city: '', state: '');

  Address get address => _address;

  // Define o endereço manualmente
  void setAddress(Address newAddress) {
    _address = newAddress;
    notifyListeners();
  }

  // Busca o endereço pela API ViaCEP
  Future<void> fetchAddressByZipCode(String zipCode) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$zipCode/json/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _address = Address(
        street: data['logradouro'],
        neighborhood: data['bairro'],
        zipCode: zipCode,
        city: data['localidade'],
        state: data['uf'],
      );
      notifyListeners();
    } else {
      throw Exception('Erro ao buscar o endereço');
    }
  }
}
