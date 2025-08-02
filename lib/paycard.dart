import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Paycard extends StatefulWidget {
  const Paycard({super.key});

  @override
  _PaycardState createState() => _PaycardState();
}

class _PaycardState extends State<Paycard> {
  Future<Map<String, dynamic>>? _payRecordFuture;

  @override
  void initState() {
    super.initState();
    _payRecordFuture = fetchData(); // Initialize the future for fetching data
  }

  Future<Map<String, dynamic>> fetchData() async {
    // Reference to Firestore instance
    /*
    final firestore = FirebaseFirestore.instance;
    
    // Fetch the 'pay' document from the 'payroll' collection
    final payDoc = await firestore.collection('payroll').doc('pay').get();
    
    // Fetch the 'booked' document from the 'payroll' collection
    final bookingDoc = await firestore.collection('payroll').doc('booked').get();

    // Return a map containing the fetched data
    return {
      'payment': payDoc.data()?['payment'] ?? '0', // Default to '0' if no data
      'booking': bookingDoc.data()?['booking'] ?? '0', // Default to '0' if no data
    };
    */
    // Temporary mock data for design purposes
    return {'payment': '0', 'booking': '0'};
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    final cardPadding = isMobile ? EdgeInsets.all(16.0) : EdgeInsets.all(24.0);
    final textSize = isMobile ? 18.0 : 16.0;
    final amountSize = isMobile ? 24.0 : 22.0;

    final cardHeight = 150;
    final cardWidth =
        isMobile ? mediaQuery.size.width * 0.4 : mediaQuery.size.width * 0.35;

    return Center(
      child: FutureBuilder<Map<String, dynamic>>(
        future: _payRecordFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data found');
          } else {
            final payment = snapshot.data!['payment'];
            final booking = snapshot.data!['booking'];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: isMobile ? 150 : 120,
                      width: cardWidth,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                              color: Colors.transparent,
                              width: 2.0), // Red border
                        ),
                        child: Padding(
                          padding: cardPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Flats Payment',
                                style: TextStyle(
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'RS.${payment}/-',
                                style: TextStyle(
                                  fontSize: amountSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: mediaQuery.size.width *
                          0.05, // Adjust the width based on screen size
                    ),
                    Container(
                      height: isMobile ? 150 : 120,
                      width: cardWidth,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                              color: Colors.transparent,
                              width: 2.0), // Red border
                        ),
                        child: Padding(
                          padding: cardPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                'Total Shop Payment',
                                style: TextStyle(
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'RS.${booking}/-', // Display fetched booking value
                                style: TextStyle(
                                  fontSize: amountSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
