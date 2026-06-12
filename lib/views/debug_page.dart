// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:wellnest/providers/health_service_provider.dart';

// class DebugPage extends ConsumerWidget {
//   const DebugPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final healthDataAsync = ref.watch(healthDataProvider);

//     return SingleChildScrollView(
//       child: healthDataAsync.when(
//         data: (data) {
//           if (data.isEmpty) {
//             return const Text('No health data found');
//           }

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Health data count: ${data.length}',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),

//               const SizedBox(height: 12),

//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final point = data[index];

//                   return Card(
//                     child: ListTile(
//                       title: Text(point.type.toString()),
//                       subtitle: Text('''
//                               Value: ${point.value}
//                               Unit: ${point.unit}
//                               From: ${point.dateFrom}
//                               To: ${point.dateTo}
//                               Source: ${point.sourceName}
//                               '''),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           );
//         },
//         loading: () {
//           return const Center(child: CircularProgressIndicator());
//         },
//         error: (error, stackTrace) {
//           debugPrint('Health provider error: $error');
//           debugPrintStack(stackTrace: stackTrace);

//           return Text('Error: $error');
//         },
//       ),
//     );
//   }
// }
