import 'package:flutter/material.dart';
import '../models/home_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as HomeItem?;
    final title = item?.title ?? 'Пункт N';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text('Картинка', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Описание пункта N',
              style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu'),
            ),
          ],
        ),
      ),
    );
  }
}