import 'package:flutter/material.dart';
import 'package:menue/constant/constant.dart';
import 'package:menue/models/menuModels.dart';

class Menulist extends StatefulWidget {
  const Menulist({super.key, required this.selectedtopic});
  final String selectedtopic;

  @override
  State<Menulist> createState() => _MenulistState();
}

class _MenulistState extends State<Menulist> {
  Map<String, List<MenuModel>> menuMap = {
    'pizzaList': pizzaList,
    'burgerList': burgerList,
    'pastaList': pastaList,
    'soupList': soupList,
    'shawermaList': shawermaList,
    'grilledList': grilledList,
  };

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    List<MenuModel> menuList = menuMap[widget.selectedtopic] ?? [];
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: menuList.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  width: ScreenSize.width / 2,
                  height: ScreenSize.height / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(menuList[index].img),
                          fit: BoxFit.fill)),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(156, 77, 72, 72),
                    ),
                    child: Column(
                      children: [
                        Text(
                          menuList[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          menuList[index].weight,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kprimaryColor,
                          ),
                          child: Text(
                            menuList[index].price,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
