import 'package:flutter/material.dart';
import 'package:money_test/constants.dart';

class ExchangeTable extends StatelessWidget {
  const ExchangeTable({Key? key}) : super(key: key);

// this page has 2 hard coded Tables and no more additional logic

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kBarColor,
        title: const Text('EXCHANGE TABLE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

            const SizedBox(
              height: 25,
            ),

            const Text('Typical Exchange Values',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),

            const SizedBox(
              height: 15,
            ),

            Container(
              height: 230,
              width: 340,
              decoration: BoxDecoration(
                  color: kExtra1Color,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2)
              ),
              child:  FittedBox(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('1 €', style: TextStyle(fontSize: 20),)),
                    DataColumn(label: Text('=')),
                    DataColumn(label: Text('36 B', style: TextStyle(fontSize: 20),)),
                  ],
                  rows:const [
                    DataRow(cells: [
                      DataCell(Text('5 €', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('180 B', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('20 €', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('720 B', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('50 €', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('1800 B', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('100 €', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('3600 B', style: TextStyle(fontSize: 20),)),
                    ]),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              height: 230,
              width: 340,
              decoration: BoxDecoration(
                  color: kExtra1Color,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2)
              ),
              child:  FittedBox(
                child:  DataTable(
                  columns: const [
                     DataColumn(label: Text('50 B', style: TextStyle(fontSize: 20),)),
                     DataColumn(label: Text('=')),
                     DataColumn(label: Text('1.39 €', style: TextStyle(fontSize: 20),)),
                  ],
                  rows:const [
                     DataRow(cells: [
                       DataCell(Text('100 B', style: TextStyle(fontSize: 20),)),
                       DataCell(Text('=')),
                       DataCell(Text('2.78€', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('250 B', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('6.95 €', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('400 B', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('11.1 €', style: TextStyle(fontSize: 20),)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1000 B', style: TextStyle(fontSize: 20),)),
                      DataCell(Text('=')),
                      DataCell(Text('27.78 €', style: TextStyle(fontSize: 20),)),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
      )
      ,
    );


  }
}
