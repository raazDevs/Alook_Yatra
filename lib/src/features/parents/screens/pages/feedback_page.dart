import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final List<Map<String, dynamic>> feedbackList = [
    {
      'id': 1,
      'recipient': 'Teacher',
      'message': 'The class needs more practical examples.',
      'response': 'Acknowledged, will improve!',
      'seen': true
    },
    {
      'id': 2,
      'recipient': 'School',
      'message': 'The library should have extended hours.',
      'response': '',
      'seen': false
    },
  ];

  final TextEditingController _messageController = TextEditingController();
  String _selectedRecipient = 'Teacher';

  void _addFeedback() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        feedbackList.add({
          'id': feedbackList.length + 1,
          'recipient': _selectedRecipient,
          'message': _messageController.text,
          'response': '',
          'seen': false,
        });
      });
      _messageController.clear();
    }
  }

  void _editFeedback(int id) {
    final feedback = feedbackList.firstWhere((item) => item['id'] == id);
    _messageController.text = feedback['message'];
    _selectedRecipient = feedback['recipient'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Feedback"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedRecipient,
                onChanged: (value) {
                  setState(() {
                    _selectedRecipient = value!;
                  });
                },
                items: ['Teacher', 'School']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
              ),
              TextField(controller: _messageController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  feedback['message'] = _messageController.text;
                  feedback['recipient'] = _selectedRecipient;
                });
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _deleteFeedback(int id) {
    setState(() {
      feedbackList.removeWhere((item) => item['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feedback Form
            Text(
              'Give Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedRecipient,
              onChanged: (value) {
                setState(() {
                  _selectedRecipient = value!;
                });
              },
              items: ['Teacher', 'School']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(hintText: "Enter your feedback"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _addFeedback, child: Text("Submit")),

            SizedBox(height: 20),
            Text(
              'Recent Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = feedbackList[index];
                  return Card(
                    child: ListTile(
                      title: Text(feedback['message']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To: ${feedback['recipient']}"),
                          Text(
                            feedback['response'].isEmpty
                                ? "No response yet"
                                : "Response: ${feedback['response']}",
                            style: TextStyle(
                              color: feedback['response'].isEmpty
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          Text(
                            feedback['seen']
                                ? "Status: Seen ✅"
                                : "Status: Not seen ❌",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editFeedback(feedback['id']),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteFeedback(feedback['id']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
