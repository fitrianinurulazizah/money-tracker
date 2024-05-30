import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HalamanKategori extends StatefulWidget {
  const HalamanKategori({super.key});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //tombol beralih pemasukan/pengeluaran
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Switch(value: true,
              onChanged: (bool value){},
              inactiveTrackColor: Colors.pink[200],
              inactiveThumbColor: Colors.pink,
              activeColor: Colors.blue,
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.add))
              ],
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.upload, color: Colors.blue),
              title: Text(
                "Infak",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                ),
            ),
          )
        ],
      ));
  }
}