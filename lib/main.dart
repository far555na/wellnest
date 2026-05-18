import 'package:flutter/material.dart';
import 'package:wellnest/services/health_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final service = HealthService();

  bool isLoading = false;
  String status = 'Not loaded yet';
  int? steps;
  List<dynamic> healthData = [];

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
      status = 'Requesting permission...';
    });

    final granted = await service.initHealth();

    if (!granted) {
      setState(() {
        isLoading = false;
        status = 'Permission denied';
      });
      return;
    }

    setState(() {
      status = 'Loading health data...';
    });

    final todaySteps = await service.getTodaySteps();
    final data = await service.getHealthData();

    setState(() {
      steps = todaySteps;
      healthData = data;
      status = 'Loaded successfully';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WellNest Health Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(status, style: Theme.of(context).textTheme.titleMedium),

                  const SizedBox(height: 20),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.directions_walk),
                      title: const Text('Today Steps'),
                      subtitle: Text(steps == null ? '-' : '$steps steps'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Health Data',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: healthData.isEmpty
                        ? const Center(child: Text('No health data found'))
                        : ListView.builder(
                            itemCount: healthData.length,
                            itemBuilder: (context, index) {
                              final item = healthData[index];

                              return Card(
                                child: ListTile(
                                  title: Text(item.type.toString()),
                                  subtitle: Text(
                                    '${item.value}\n'
                                    '${item.dateFrom} - ${item.dateTo}',
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadData,
        tooltip: 'Load Health Data',
        child: const Icon(Icons.health_and_safety),
      ),
    );
  }
}
