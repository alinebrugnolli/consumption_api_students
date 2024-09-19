import 'dart:convert';

class Telephone {
  int ddd;
  String telephone;
  Telephone({
    required this.ddd,
    required this.telephone,
  });

  // Método que pega o nosso objeto telephone e transforma em um Objeto Map<String, dynamic>
  // toMap()
  // Passo 1:
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telephone': telephone,
    };
  }

  // Método que pega um Map<String, dynamic> e transforma em um json Pelo pacote dart: convert (jsonEncode)
  // toJson
  // Passo 2:
  String toJson() => jsonEncode(toMap());

  // Passo 2 da desserialização:
  factory Telephone.fromMap(Map<String, dynamic> map) {
    return Telephone(
      ddd: map['ddd'] ?? 0,
      telephone: map['telephone'] ?? '',
    );
  }

  // Passo 1:
  // OBS: Se utilizar o client http DIO, não precisa fazer esse passo.
  // O DIO faz esse passo automaticamente.
  factory Telephone.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Telephone.fromMap(jsonMap);
  }

}
