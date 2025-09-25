import 'package:flutter/material.dart';

void main() => runApp(const Lab5App());

class Lab5App extends StatelessWidget {
  const Lab5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 — Widgets',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Lab 5 — Flutter Widgets')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SectionTitle('1. Container widget tasks'),
              ContainerDemo(),
              SizedBox(height: 24),
              SectionTitle('2. Column & Row tasks'),
              ColumnRowDemo(),
              SizedBox(height: 24),
              SectionTitle('3. TextField tasks'),
              TextFieldDemo(),
              SizedBox(height: 24),
              SectionTitle('4. Expanded / Spacer tasks'),
              ExpandedDemo(),
              SizedBox(height: 24),
              SectionTitle('5. Profile Card challenge'),
              ProfileCard(),
              SizedBox(height: 24),
              SectionTitle('6. Product Item challenge'),
              ProductItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(16.0),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.home, size: 48),
      ),
    );
  }
}

class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Column with 5 children (CrossAxisAlignment.start)'),
        Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('Row with 5 children (MainAxisAlignment.spaceEvenly)'),
        Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 50),
            ],
          ),
        ),
      ],
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});
  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showValue() {
    final text = _controller.text;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Value: "$text"')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your password',
            icon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
            onPressed: _showValue, child: const Text('Show controller value')),
      ],
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Row: red flex=1, green flex=2'),
        Container(
          height: 120,
          color: Colors.grey.shade100,
          child: Row(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.red)),
              Expanded(flex: 2, child: Container(color: Colors.green)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('Column: red flex=1, green flex=2'),
        Container(
          height: 200,
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.red)),
              Expanded(flex: 2, child: Container(color: Colors.green)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('Spacer: push blue and orange apart'),
        Row(
          children: [
            Container(width: 80, height: 60, color: Colors.blue),
            const Spacer(),
            Container(width: 80, height: 60, color: Colors.orange),
          ],
        ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 28, child: Text('A')),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('User Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text('@username', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('A short bio about the user goes here...'),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: null, child: Text('Follow')),
              ElevatedButton(onPressed: null, child: Text('Message')),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              'https://via.placeholder.com/100',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Product Title',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('A brief description of the item goes here.'),
                SizedBox(height: 8),
                Text('\$99.99',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
