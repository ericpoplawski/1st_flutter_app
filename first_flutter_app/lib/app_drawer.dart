import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  final String userName;

  const AppDrawer({
    super.key,
    this.userName = 'Eric',
  });

Future<void> openWhatsAppChat(BuildContext context, {required String userName}) async {
  final encodedMessage = Uri.encodeComponent(
    "Hola, soy $userName y quiero inscribir mi garage",
  );
  const phone = '59893535700';
  final url = Uri.parse('https://wa.me/$phone?text=$encodedMessage');

  final canLaunch = await canLaunchUrl(url);
  if (!context.mounted) return;  // 🔔 <- Este guard permite evitar problemas si el widget fue destruido

  if (canLaunch) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No se pudo abrir WhatsApp: app no instalada'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
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
            leading: const Icon(Icons.calendar_today),
            title: const Text('Reservas realizadas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.garage),
            title: const Text('Mis garajes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text('Reservas a mis garajes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Datos personales'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {},
          ),
          const Spacer(),
          Align(
            alignment: const Alignment(0.5, 0),
            child: IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 50,
                color: Colors.green,
              ),
              onPressed: () {
                openWhatsAppChat(context, userName: userName);
              },
            ),
          ),
          const Padding(
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