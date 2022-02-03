import 'package:flutter/material.dart';

import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })          
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
                // return Card(
                //     child: Row(
                //   children: <Widget>[
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //       padding: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //         color: Theme.of(context).primaryColor,
                //         width: 2,
                //       )),
                //       child: Text(
                //         '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transactions[index].title,
                //           style: Theme.of(context).textTheme.headline6,
                //         ),
                //         Text(
                //           DateFormat.yMMMd().format(transactions[index].date),
                //           style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: 10,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ],
                // ));
              },
              itemCount: transactions.length,    
    );
  }
}


