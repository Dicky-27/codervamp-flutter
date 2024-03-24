import 'package:codervamp/widgets/expandable/components/wallet_card_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableCardPage extends StatefulWidget {
  const ExpandableCardPage({super.key});

  @override
  State<ExpandableCardPage> createState() => _ExpandableCardPageState();
}

class _ExpandableCardPageState extends State<ExpandableCardPage> {
  final _expandableController = ExpandableController();
  final _scrollController = ScrollController();
  final ValueNotifier<double> _cardHeight = ValueNotifier(200);

  @override
  void initState() {
    super.initState();
    _addScrollListener();
    _expandableController.expanded = true;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cardHeight.dispose();
    super.dispose();
  }

  void _addScrollListener() {
    double height = 0;

    _cardHeight.addListener(() {
      height = _cardHeight.value;
    });

    _scrollController.addListener(() {
      _cardHeight.value = 200 - _scrollController.offset / 2;
      _cardHeight.value = _cardHeight.value.clamp(100, 200);
      _expandableController.expanded = height >= 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.black, Colors.grey[850]!],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 40),
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _cardHeight,
              builder: (context, value, child) {
                return AnimatedContainer(
                    height: value,
                    duration: const Duration(milliseconds: 0),
                    child: WalletCardWidget(
                      expandableController: _expandableController,
                    ));
              }),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction.description,
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text(transaction.date,
                      style: TextStyle(color: Colors.grey[400])),
                  trailing: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: transaction.amount < 0
                          ? Colors.red[400]
                          : Colors.green[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}

class TransactionHistory {
  final String id;
  final String date;
  final String description;
  final double amount;

  TransactionHistory({
    required this.id,
    required this.date,
    required this.description,
    required this.amount,
  });
}

final List<TransactionHistory> transactions = [
  TransactionHistory(
      id: '1', date: '2024-03-24', description: 'Coffee Shop', amount: -5.75),
  TransactionHistory(
      id: '2', date: '2024-03-23', description: 'Book Store', amount: -20.45),
  TransactionHistory(
      id: '3',
      date: '2024-03-22',
      description: 'Grocery Store',
      amount: -76.32),
  TransactionHistory(
      id: '4',
      date: '2024-03-21',
      description: 'Online Subscription',
      amount: -12.99),
  TransactionHistory(
      id: '5',
      date: '2024-03-20',
      description: 'Gym Membership',
      amount: -25.00),
  TransactionHistory(
      id: '6',
      date: '2024-03-19',
      description: 'Electric Bill',
      amount: -60.75),
  TransactionHistory(
      id: '7', date: '2024-03-18', description: 'Water Bill', amount: -30.89),
  TransactionHistory(
      id: '8', date: '2024-03-17', description: 'Gas Station', amount: -45.25),
  TransactionHistory(
      id: '9', date: '2024-03-16', description: 'Restaurant', amount: -85.50),
  TransactionHistory(
      id: '10', date: '2024-03-15', description: 'Pharmacy', amount: -23.45),
  TransactionHistory(
      id: '1', date: '2024-03-24', description: 'Coffee Shop', amount: -5.75),
  TransactionHistory(
      id: '2', date: '2024-03-23', description: 'Book Store', amount: -20.45),
  TransactionHistory(
      id: '3',
      date: '2024-03-22',
      description: 'Grocery Store',
      amount: -76.32),
  TransactionHistory(
      id: '4',
      date: '2024-03-21',
      description: 'Online Subscription',
      amount: -12.99),
  TransactionHistory(
      id: '5',
      date: '2024-03-20',
      description: 'Gym Membership',
      amount: -25.00),
  TransactionHistory(
      id: '6',
      date: '2024-03-19',
      description: 'Electric Bill',
      amount: -60.75),
  TransactionHistory(
      id: '7', date: '2024-03-18', description: 'Water Bill', amount: -30.89),
  TransactionHistory(
      id: '8', date: '2024-03-17', description: 'Gas Station', amount: -45.25),
];
