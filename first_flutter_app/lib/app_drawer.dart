import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            accountName: Text('ParkAndGo'),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Reservas realizadas'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.garage),
            title: Text('Mis garajes'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.check_box),
            title: Text('Reservas a mis garajes'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Datos personales'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            onTap: () {
            },
          ),
          Spacer(),
          Align(
            alignment: Alignment(0.5, 0),
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 50,
                color: Colors.green,
              ),
              onPressed: () async {
                const phone = '59893535700';
                final url = Uri.parse('https://wa.me/$phone');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'No se pudo abrir WhatsApp';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'contacto@parkandgo.uy',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
