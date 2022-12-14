import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import '../../modelos/nota.dart';
class ListaDePreferencias {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

/// Guarda la lista de preferencias en el dispositivo
  Future<void> guardarNota(List<Nota> listaDeNotas) async {
    final SharedPreferences prefs = await _prefs;
    List<String> listaSP = listaDeNotas.map((nota) => convert.jsonEncode(nota.toJson())).toList();
    prefs.setStringList('Notas', listaSP);
  }

/// Lee la lista de preferencias en el dispositivo
  Future<List<Nota>?> leeListaDePref() async {
    final SharedPreferences prefs = await _prefs;
    List<String>? listaSP = prefs.getStringList('Notas');
    List<Nota> notasList = listaSP?.map((nota) => Nota.fromJson(convert.jsonDecode(nota))).toList() ?? [];
    return notasList;
  }

/// Borra la lista de preferencias en el dispositivo
  Future<void> borraLista() async {
    final SharedPreferences prefs = await _prefs;
    List<String> listaSP = [];
    prefs.setStringList('Notas', listaSP);
  }
}
