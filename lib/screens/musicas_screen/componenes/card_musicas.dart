import 'package:avaliacao2/screens/editar_musicas/editar_musicas_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../helpers/helpers.dart';
import '../../../models/models.dart';

class CardMusicas extends StatelessWidget {
  final Artista artista;
  final Musicas musicas;
  CardMusicas({required this.musicas, required this.artista});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DeletarMusicas, ListaMusicas>(
      builder: (_, deletarMusicas, listaMusicas, __) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 3,
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.fromLTRB(16, 4, 4, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditarMusicasScreen(
                                      artista: artista,
                                      musicas: musicas,
                                    ),
                                  ),
                                );
                              },
                              tooltip: "Editar",
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: deletarMusicas.loading
                                  ? null
                                  : () async {
                                      await deletarMusicas.deleteDeletarMusicas(
                                        artista: artista,
                                        musicas: musicas,
                                      );
                                      listaMusicas.getListaMusicas(
                                          idArtista: artista.id);
                                    },
                              tooltip: "Deletar",
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          (musicas.nomeMusica),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Estilo: " + musicas.estilo,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Dura????o: " + musicas.duracao,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
