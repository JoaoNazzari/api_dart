import 'package:apidart/database.dart';
import 'package:apidart/middleware.dart';
import 'package:apidart/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  // Inicializa o banco de dados SQLite
  final db = DatabaseHelper();
  db.initialize();
  print('✅ Banco de dados SQLite inicializado');

  // Cria o pipeline: Middleware → Router
  final handler = Pipeline()
      .addMiddleware(logMiddleware())
      .addMiddleware(corsMiddleware())
      .addMiddleware(authMiddleware())
      .addHandler(filmeRouter(db).call);

  // Inicia o servidor
  final server = await io.serve(handler, 'localhost', 8080);
  print('🚀 Servidor rodando em http://${server.address.host}:${server.port}');
  print('📋 Endpoints de Filmes disponíveis:');
  print('   GET    /filmes                          → Listar todos');
  print('   GET    /filmes/<id>                     → Buscar por Id');
  print('   GET    /filmes?idade=14                 → Filtro por idade');
  print('   GET    /filmes?genero=Acao              → Filtro por gênero');
  print('   GET    /filmes?idade=14&genero=Acao     → Filtro por idade e gênero');
  print('   POST   /filmes                          → Criar novo (Auth: 123)');
  print('   PUT    /filmes/<id>                     → Atualizar');
  print('   DELETE /filmes/<id>                     → Deletar');
}
