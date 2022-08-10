import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: <Widget>[

          const SizedBox(height: 20.0, ),
          
          Text('Não ha Transação',
          style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0, ),
          SizedBox(
            height: 120,
            child: Image.asset(
              'assets/images/witing.png',
              fit: BoxFit.cover,
            ),
          ),

        ],
      ) :
      ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                     // style: TextStyle(
                      //  fontSize: 16,
                      //  fontWeight: FontWeight.bold,
                      //  color: Theme.of(context).colorScheme.secondary,
                      //),
                    ),
                    Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
