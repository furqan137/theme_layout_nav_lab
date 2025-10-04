import 'package:flutter/material.dart';

class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Alignments Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: MainAxisAlignment Examples
            Text(
              'MainAxisAlignment Examples',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),

            _buildAlignmentDemo(
              context,
              'Start',
              MainAxisAlignment.start,
              CrossAxisAlignment.center,
            ),
            _buildAlignmentDemo(
              context,
              'End',
              MainAxisAlignment.end,
              CrossAxisAlignment.center,
            ),
            _buildAlignmentDemo(
              context,
              'Center',
              MainAxisAlignment.center,
              CrossAxisAlignment.center,
            ),
            _buildAlignmentDemo(
              context,
              'SpaceBetween',
              MainAxisAlignment.spaceBetween,
              CrossAxisAlignment.center,
            ),
            _buildAlignmentDemo(
              context,
              'SpaceAround',
              MainAxisAlignment.spaceAround,
              CrossAxisAlignment.center,
            ),
            _buildAlignmentDemo(
              context,
              'SpaceEvenly',
              MainAxisAlignment.spaceEvenly,
              CrossAxisAlignment.center,
            ),

            const SizedBox(height: 30),

            // Section 2: CrossAxisAlignment Examples
            Text(
              'CrossAxisAlignment Examples',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),

            _buildCrossAlignmentDemo(context, 'Start', CrossAxisAlignment.start),
            _buildCrossAlignmentDemo(context, 'End', CrossAxisAlignment.end),
            _buildCrossAlignmentDemo(context, 'Center', CrossAxisAlignment.center),
            _buildCrossAlignmentDemo(context, 'Stretch', CrossAxisAlignment.stretch),
          ],
        ),
      ),
    );
  }

  /// Function to build Row alignment demos
  Widget _buildAlignmentDemo(
      BuildContext context,
      String title,
      MainAxisAlignment mainAxis,
      CrossAxisAlignment crossAxis,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: mainAxis,
                crossAxisAlignment: crossAxis,
                children: [
                  _buildBox(Colors.red),
                  _buildBox(Colors.green),
                  _buildBox(Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Function to build Column alignment demos
  Widget _buildCrossAlignmentDemo(
      BuildContext context,
      String title,
      CrossAxisAlignment crossAxis,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: crossAxis,
                children: [
                  _buildBox(Colors.red, width: 50),
                  const SizedBox(height: 8),
                  _buildBox(Colors.green, width: 80),
                  const SizedBox(height: 8),
                  _buildBox(Colors.blue, width: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable box for demos
  Widget _buildBox(Color color, {double width = 40}) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
