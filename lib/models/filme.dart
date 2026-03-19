// lib/models/tarefa.dart
// Modelo de dados para a entidade Filme

class Filme {
  final int? id;
  final String titulo;
  final String genero;
  final String duracao;
  final int faixa_etaria;

  Filme({
    this.id,
    required this.titulo,
    required this.genero,
    required this.duracao,
    required this.faixa_etaria
  });

  /// Cria uma Filme a partir de um Map (vindo do JSON ou do banco)
  factory Filme.fromMap(Map<String, dynamic> map) {
    return Filme(
      id: map['id'] as int?,
      titulo: map['titulo'] as String,
      genero: map['genero'] as String,
      duracao: map['duracao'] as String,
      faixa_etaria: map['faixa_etaria'] as int,
    );
  }

  /// Converte a Filme para Map (para salvar no banco ou retornar como JSON)
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'genero': genero,
      'duracao': duracao,
      'faixa_etaria': faixa_etaria,
    };
  }

  /// Converte para JSON (resposta da API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'genero': genero,
      'duracao': duracao,
      'faixa_etaria': faixa_etaria,
    };
  }
}
