import 'package:flutter/material.dart';

class Category {
  final String name;
  final List<SubCategory> subcategories;
  bool isExpanded = true;

  Category({required this.name, required this.subcategories});
}

class SubCategory {
  final String name;
  final String route;

  SubCategory({required this.name, required this.route});
}

class MyCategoryListPage extends StatefulWidget {
  @override
  _MyCategoryListPageState createState() => _MyCategoryListPageState();
}

class _MyCategoryListPageState extends State<MyCategoryListPage> {
  List<Category> categories = [
    Category(
      name: 'Flutter',
      subcategories: [
        SubCategory(name: 'Link', route: '/Flutter/Link'),
        SubCategory(name: 'Haber', route: '/Flutter/Haber'),
      ],
    ),
    Category(
      name: 'Unity',
      subcategories: [
        SubCategory(name: 'Link', route: '/Unity/Link'),
        SubCategory(name: 'Haber', route: '/Unity/Haber'),
      ],
    ),
    Category(
      name: 'Oyun Sanatı',
      subcategories: [
        SubCategory(name: 'Link', route: '/Tasarım/Link'),
        SubCategory(name: 'Haber', route: '/Tasarım/Haber'),
      ],
    ),
    Category(
      name: 'Girişimcilik',
      subcategories: [
        SubCategory(name: 'Link', route: '/Girişimcilik/Link'),
        SubCategory(name: 'Haber', route: '/Girişimcilik/Haber'),
      ],
    ),
    Category(
      name: 'Proje Yönetimi',
      subcategories: [
        SubCategory(name: 'Link', route: '/ProjeYönetimi/Link'),
        SubCategory(name: 'Haber', route: '/ProjeYönetimi/Haber'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Kategoriler'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          dividerColor: Colors.grey,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              categories[index].isExpanded = !isExpanded;
            });
          },
          children: categories.map((Category category) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(category.name),
                );
              },
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: category.subcategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(category.subcategories[index].name),
                    onTap: () {
                      Navigator.pushNamed(
                          context, category.subcategories[index].route);
                    },
                  );
                },
              ),
              isExpanded: category.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
