import 'package:flutter/material.dart';
import 'package:meals/src/components/main_drawer.dart';
import 'package:meals/src/models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage(
      {super.key, required this.onSettingsChanged, required this.settings});

  final Settings settings;

  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Exibe refeições sem glúten!',
                  settings.isGlutenFree,
                  (bool value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Exibe refeições sem lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Exibe refeições Veganas!',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariano',
                  'Exibe refeições Vegetarianas!',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ))
          ],
        ));
  }
}
