import 'dart:async';
import 'package:flutter/material.dart';
import 'package:groq/groq.dart';  // Import Groq package

class AIAssistantPage extends StatefulWidget {
  const AIAssistantPage({Key? key}) : super(key: key);

  @override
  State<AIAssistantPage> createState() => _AIAssistantPageState();
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // Store chat messages here
  bool _isLoading = false;

  late final Groq _groq; // Declare Groq client

  @override
  void initState() {
    super.initState();
    // Initialize Groq API client with API key passed via environment
    _groq = Groq(apiKey: const String.fromEnvironment('groqApiKey'));
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    // Add the user's message
    setState(() {
      _messages.add({'user': _controller.text});
      _isLoading = true;
    });

    final userMessage = _controller.text;
    _controller.clear();

    try {
      // Start a new chat session or continue an existing one
      _groq.startChat();

      // Send the message to the Groq API
      GroqResponse response = await _groq.sendMessage(userMessage);

      // Get the bot's response (the assistant's reply)
      final botMessage = response.choices.first.message.content?.trim() ?? 'I didn’t quite get that. Could you rephrase?';

      // Add the bot's message to the chat history
      setState(() {
        _messages.add({'bot': botMessage});
      });
    } on GroqException catch (error) {
      // Handle any errors from the Groq API
      print('Error occurred: ${error.message}');

      // Add error message to chat history
      setState(() {
        _messages.add({'bot': 'Error: Unable to connect to the server. Please try again later.'});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Assistant',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,  // White text for contrast
          ),
        ),
        backgroundColor: Colors.teal,  // Teal background for the app bar
        elevation: 0,  // No shadow for a clean look
        toolbarHeight: 70,  // Adjust height to avoid extra space
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message.containsKey('user');
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: IntrinsicWidth(  // Ensures the bubble width adjusts to message length
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75, // Max width of 75% of the screen
                          ),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.lightGreen[100] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3), // Shadow for depth
                              ),
                            ],
                          ),
                          child: Text(
                            isUser ? message['user']! : message['bot']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isUser ? Colors.black : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,  // Keep the input field size to a minimum
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.teal),
                    onPressed: _isLoading ? null : _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
