import 'package:flutter/material.dart';
import 'package:youtbe/Api.dart';
import 'package:youtbe/Model/Video.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];

                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(video.imagem)),
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.red,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("nenhum dado a ser exibido"),
              );
            }
            break;
        }
      },
    );
  }
}
