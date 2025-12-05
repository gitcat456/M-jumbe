import 'package:flutter/material.dart';
import 'report_issue_page.dart';

class ReportedIssuesPage extends StatelessWidget {
  const ReportedIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        // ← Go Back Arrow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          "Reported Issues",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        // ❌ REMOVED PROFILE ICON
        actions: const [],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: "Search by title or location...",
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔵 Category Chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryChip("All", true),
                  categoryChip("Water", false),
                  categoryChip("Roads", false),
                  categoryChip("Electricity", false),
                  categoryChip("Waste", false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 📌 Issue Cards List
            Expanded(
              child: ListView(
                children: [
                  issueCard(
                    status: "Pending",
                    statusColor: Colors.orange,
                    title: "Large Pothole on Ngong Road",
                    location: "Kilimani, Nairobi",
                    time: "4 hours ago",
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/5/57/Pothole.jpg",
                  ),
                  issueCard(
                    status: "In Progress",
                    statusColor: Colors.amber,
                    title: "Broken Streetlight on Moi Avenue",
                    location: "CBD, Nairobi",
                    time: "2 days ago",
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/8/8e/Street_light_Example.jpg",
                  ),
                  issueCard(
                    status: "Resolved",
                    statusColor: Colors.green,
                    title: "Leaking Water Pipe in Westlands",
                    location: "Westlands, Nairobi",
                    time: "1 week ago",
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/1/1a/Water_leak_example.jpg",
                  ),
                  issueCard(
                    status: "Pending",
                    statusColor: Colors.orange,
                    title: "Uncollected Garbage Pile",
                    location: "Eastleigh, Nairobi",
                    time: "5 hours ago",
                    imageUrl: "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ➕ Floating Create Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportNewIssuePage()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  // 🔹 Category Chip widget
  Widget categoryChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: selected ? null : Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // 🔹 Issue Card widget
  Widget issueCard({
    required String status,
    required Color statusColor,
    required String title,
    required String location,
    required String time,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Left Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 5, backgroundColor: statusColor),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey.shade200,
              child: imageUrl.isEmpty
                  ? const Icon(Icons.image_not_supported, color: Colors.grey)
                  : Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
