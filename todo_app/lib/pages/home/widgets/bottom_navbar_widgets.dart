import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0; // Track selected index

  void _showProgressMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1), // Adjust as needed
      ),
    );
  }

  void _onTabPressed() {
    setState(() {
      _selectedIndex = 0;
      _showProgressMessage('Tab button working is on progress...');
      // Add your specific logic for the tab button here
    });
  }

  void _onSortPressed() {
    setState(() {
      _selectedIndex = 1;
      _showProgressMessage('Sort button working is on progress...');
      // Add your specific logic for the sort button here
    });
  }

  void _onMorePressed() {
    setState(() {
      _selectedIndex = 2;
      _showProgressMessage('More button working is on progress...');
      // Add your specific logic for the more button here
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.orange[50],
      // shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Adjust as needed
        children: [
          IconButton(
            onPressed: _onTabPressed,
            icon: const Icon(Icons.tab),
            color: _selectedIndex == 0 ? Colors.blue : Colors.black,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: _onSortPressed,
            icon: const Icon(Icons.sort),
            color: _selectedIndex == 1 ? Colors.blue : Colors.black,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: _onMorePressed,
            icon: const Icon(Icons.more_horiz),
            color: _selectedIndex == 2 ? Colors.blue : Colors.black,
          ),
        ],
      ),
    );
  }
}
