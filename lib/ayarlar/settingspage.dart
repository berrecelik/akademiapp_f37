// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

class DetayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Bildirim'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BildirimSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Hesap  Ayarları'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HesapSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Tamamlanan Kurslar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TamamlanmaSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Akademi Hakkında'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HakkindaSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Akademi İletişim Bilgileri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IletisimSayfasi()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TamamlanmaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Tamamlanan Kurslar'),
      ),
      body: Center(
        child: Text('Bütün Eğitimleri Tamamladınız.'),
      ),
    );
  }
}

class BildirimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Bildirim'),
      ),
      body: Center(
        child: Text('Yeni Bildirim Bulunmamaktadır.'),
      ),
    );
  }
}

class IletisimSayfasi extends StatelessWidget {
  final String linkedinLink =
      'https://www.linkedin.com/company/oyunveuygulamaakademisi/';
  final String facebookLink =
      'https://www.facebook.com/OyunOyun-102300295566904';
  final String instagramLink =
      'https://www.instagram.com/oyunveuygulamaakademisi/';
  final String youtubeLink =
      'https://www.youtube.com/channel/UCGPT_x7LxptjKRLP-WD2JLA';
  final String twitterLink = 'https://twitter.com/oyunveuygulama';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: const Text('Akademi İletişim Bilgileri'),
      ),
      body: ListView(
        children: [
          DataTable(
            columnSpacing: 30,
            columns: const [
              DataColumn(
                label: Text(
                  'Sosyal Medya',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Hesap',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: [
              DataRow(cells: [
                DataCell(InkWell(
                    child: Text('LinkedIn'),
                    onTap: () => launch(linkedinLink))),
                DataCell(InkWell(
                    child: Text('oyunveuygulamaakademisi'),
                    onTap: () => launch(linkedinLink))),
              ]),
              DataRow(cells: [
                DataCell(InkWell(
                    child: Text('Instagram'),
                    onTap: () => launch(instagramLink))),
                DataCell(InkWell(
                    child: Text('oyunveuygulamaakademisi'),
                    onTap: () => launch(instagramLink))),
              ]),
              DataRow(cells: [
                DataCell(InkWell(
                    child: Text('YouTube'), onTap: () => launch(youtubeLink))),
                DataCell(InkWell(
                    child: Text('Oyun ve Uygulama Akademisi'),
                    onTap: () => launch(youtubeLink))),
              ]),
              DataRow(cells: [
                DataCell(InkWell(
                    child: Text('Twitter'), onTap: () => launch(twitterLink))),
                DataCell(InkWell(
                    child: Text('oyunveuygulama'),
                    onTap: () => launch(twitterLink))),
              ]),
              DataRow(cells: [
                DataCell(InkWell(
                    child: Text('Facebook'),
                    onTap: () => launch(facebookLink))),
                DataCell(InkWell(
                    child: Text('OyunOyun ve Uygulama Akademisi'),
                    onTap: () => launch(facebookLink))),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class HakkindaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: const Text('Akademi Hakkında'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Oyun ve Uygulama Akademisi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Google Türkiye, Sanayi ve Teknoloji Bakanlığı, Cumhurbaşkanlığı Dijital Dönüşüm Ofisi'nin desteği ve Girişimcilik Vakfı ve T3 Girişim Merkezi'nin iş birliğinde 2021 yılında hayata geçen Oyun ve Uygulama Akademisi, Türkiye’de oyun geliştirme, uygulama yazılımcılığı ve bu iki alanın girişimcilikle bir araya gelmesini destekleyen bütüncül bir yetkinlik kazandırma programıdır. Program kapsamında bursiyerler kariyer hayatları boyunca faydalanabilecekleri yetkinlikler kazanarak, tamamladıkları eğitimler için sertifika almaya hak kazanacaktır. Oyun ve Uygulama Akademisi’nde, gençlere yeni dijital beceriler edinmelerini sağlayacak eğitimler sunarak Türkiye’deki nitelikli iş gücünün yetiştirilmesine katkı sunuyoruz. Gençlerin hızla gelişen Bilgi İletişim Teknolojileri çağında talep gören yazılım, oyun tasarımı, uygulama geliştirme, proje yönetimi, girişimcilik gibi farklı alanlarda yetkinlik kazanmasını ve böylece Türkiye’nin dijitalleşme sürecini hızlandırmayı hedefliyoruz. Programa, üniversite öğrencileri ve üniversiteden yeni mezun olmuş, iş arayışında veya sektör değiştirip Bilgi İletişim Teknolojileri sektöründe geçiş yaparak bu alanda işe girmek ya da kendi teknoloji girişimini kurmak isteyen 18-29 yaş arasındaki üniversite öğrencisi veya mezunu bireyler başvurabilmektedir.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Aşağıdaki e-posta adresinden Akademi ile iletişime geçebilirsiniz.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () =>
                    launch('mailto:info@oyunveuygulamaakademisi.com'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.redAccent[100]),
                    const SizedBox(width: 8),
                    const Text('info@oyunveuygulamaakademisi.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HesapSayfasi extends StatefulWidget {
  @override
  _HesapSayfasiState createState() => _HesapSayfasiState();
}

class _HesapSayfasiState extends State<HesapSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent[100],
          title: Text("Hesap Ayarları"),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Kullanıcı İsmi Değiştirme'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Şifre Yenileme'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Profil Fotoğrafı Güncelleme'),
            onTap: () {},
          ),
        ]));
  }
}
