import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Ayarlar'),
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
            title: Text('Gizlilik'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GizlilikSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Hakkında'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HakkindaSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Hesap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HesapSayfasi()),
              );
            },
          ),
          ListTile(
            title: Text('Yardım'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YardimSayfasi()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GizlilikSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: Text('Gizlilik'),
      ),
      body: Center(
        child: Text('Gizlilik Sayfası'),
      ),
    );
  }
}

class HesapSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Hesap'),
      ),
      body: Center(
        child: Text('Hesap Sayfası'),
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
        title: Text('Hakkında'),
      ),
      body: Center(
        child: Text('Hakkında Sayfası'),
      ),
    );
  }
}

class YardimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: const Text('Yardım'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Bize Ulaşın'),
        ),
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
        child: Text('Bildirim Sayfası'),
      ),
    );
  }
}
