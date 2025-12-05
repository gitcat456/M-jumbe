import 'package:flutter/material.dart';
import 'issue_details_page.dart';
import 'models/issue.dart';

class WardIssuesDashboard extends StatefulWidget {
  const WardIssuesDashboard({Key? key}) : super(key: key);

  @override
  State<WardIssuesDashboard> createState() => _WardIssuesDashboardState();
}

class _WardIssuesDashboardState extends State<WardIssuesDashboard> {
  String selectedCategory = "All";
  String selectedStatus = "Open";

  // ------------------ ISSUE LIST ------------------
  List<Issue> issues = [
    Issue(
      title: 'Major Pothole on Main Street',
      description: 'A large pothhole causing traffic disruptions.',
      location: 'Main Street near Kileleshwa',
      status: 'Open',
      date: '24 Oct 2023',
      time: '10:30 AM', // 👈 ADD THIS
      ward: 'Kileleshwa Ward',
      category: 'Roads',
      imageUrl: 'https://via.placeholder.com/80',
    ),

    Issue(
      title: 'Major Pothole on Main Street',
      description: 'A large pothhole causing traffic disruptions.',
      location: 'Main Street near Kileleshwa',
      status: 'Open',
      date: '24 Oct 2023',
      time: '10:30 AM', // 👈 ADD THIS
      ward: 'Kileleshwa Ward',
      category: 'Roads',
      imageUrl: 'https://via.placeholder.com/80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      // -------------------- APP BAR --------------------
      appBar: AppBar(
        title: const Text('Ward Issues Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------- TOP CARDS --------------------
              Row(
                children: [
                  _buildStatCard(
                    "Open",
                    _countByStatus("Open").toString(),
                    Colors.red,
                  ),
                  const SizedBox(width: 12),
                  _buildStatCard(
                    "In Progress",
                    _countByStatus("In Progress").toString(),
                    Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  _buildStatCard(
                    "Resolved",
                    _countByStatus("Resolved").toString(),
                    Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // -------------------- FILTERS --------------------
              _filtersUI(),

              const SizedBox(height: 24),

              // -------------------- ISSUE LIST --------------------
              _buildIssueList(),
            ],
          ),
        ),
      ),
    );
  }

  // ====================== COUNT BY STATUS ======================
  int _countByStatus(String status) {
    return issues.where((i) => i.status == status).length;
  }

  // ====================== TOP STAT CARD ======================
  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(top: BorderSide(color: color, width: 4)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ====================== FILTERS ======================
  Widget _filtersUI() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filters",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              // CATEGORY
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: _inputDeco("Category"),
                  items: const [
                    DropdownMenuItem(value: "All", child: Text("All")),
                    DropdownMenuItem(value: "Roads", child: Text("Roads")),
                    DropdownMenuItem(value: "Water", child: Text("Water")),
                    DropdownMenuItem(
                      value: "Sanitation",
                      child: Text("Sanitation"),
                    ),
                    DropdownMenuItem(value: "Power", child: Text("Power")),
                  ],
                  onChanged: (value) {
                    setState(() => selectedCategory = value!);
                  },
                ),
              ),

              const SizedBox(width: 12),

              // STATUS
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: _inputDeco("Status"),
                  items: const [
                    DropdownMenuItem(value: "Open", child: Text("Open")),
                    DropdownMenuItem(
                      value: "In Progress",
                      child: Text("In Progress"),
                    ),
                    DropdownMenuItem(
                      value: "Resolved",
                      child: Text("Resolved"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() => selectedStatus = value!);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDeco(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  // ====================== ISSUE LIST FILTERED ======================
  Widget _buildIssueList() {
    List<Issue> filtered = issues.where((issue) {
      bool categoryOK =
          selectedCategory == "All" || issue.category == selectedCategory;
      bool statusOK = issue.status == selectedStatus;
      return categoryOK && statusOK;
    }).toList();

    return Column(
      children: filtered.map((issue) => _issueCard(issue)).toList(),
    );
  }

  // ====================== ISSUE CARD (LIKE BEFORE) ======================
  Widget _issueCard(Issue issue) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT SIDE TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status dot + status text
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: issue.status == "Open"
                            ? Colors.red
                            : issue.status == "In Progress"
                            ? Colors.orange
                            : Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      issue.status,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  issue.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(issue.ward, style: const TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(issue.date, style: const TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 10),

                // VIEW DETAILS BUTTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => IssueDetailsPage(issue: issue),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // RIGHT SIDE IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              issue.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
