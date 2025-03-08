import 'package:flutter/material.dart';

class Job {
  final String title;
  final String company;
  final String status;
  final String salary;
  final String category;

  Job({
    required this.title,
    required this.company,
    required this.status,
    required this.salary,
    required this.category,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Job> _jobs = [
 // IT Jobs
  Job(title: 'Software Engineer', company: 'TechCorp', status: 'Full-time', salary: 'P 100K - 200K', category: 'IT'),
  Job(title: 'Data Analyst', company: 'DataCo', status: 'Part-time', salary: 'P 80K - 150K', category: 'IT'),
  Job(title: 'System Administrator', company: 'SysAdmin Co.', status: 'Full-time', salary: 'P 90K - 120K', category: 'IT'),

  // Marketing Jobs
  Job(title: 'Marketing Specialist', company: 'MarketGenius', status: 'Full-time', salary: 'P 60K - 100K', category: 'Marketing'),
  Job(title: 'Social Media Manager', company: 'SocialBuzz', status: 'Part-time', salary: 'P 50K - 90K', category: 'Marketing'),
  Job(title: 'Brand Strategist', company: 'BrandX', status: 'Full-time', salary: 'P 70K - 120K', category: 'Marketing'),

  // Finance Jobs
  Job(title: 'Financial Analyst', company: 'FinCorp', status: 'Full-time', salary: 'P 90K - 150K', category: 'Finance'),
  Job(title: 'Accountant', company: 'TaxSolutions', status: 'Part-time', salary: 'P 60K - 100K', category: 'Finance'),
  Job(title: 'Investment Banker', company: 'WealthBank', status: 'Full-time', salary: 'P 120K - 250K', category: 'Finance'),

  // Design Jobs
  Job(title: 'Graphic Designer', company: 'CreativeStudio', status: 'Full-time', salary: 'P 50K - 100K', category: 'Design'),
  Job(title: 'UX/UI Designer', company: 'InnovateTech', status: 'Part-time', salary: 'P 70K - 120K', category: 'Design'),
  Job(title: 'Illustrator', company: 'ArtWorks', status: 'Freelance', salary: 'P 40K - 90K', category: 'Design'),

  // Sales Jobs
  Job(title: 'Sales Representative', company: 'RetailX', status: 'Full-time', salary: 'P 50K - 90K', category: 'Sales'),
  Job(title: 'Business Development Manager', company: 'GrowthHub', status: 'Full-time', salary: 'P 80K - 150K', category: 'Sales'),
  Job(title: 'Customer Success Manager', company: 'ClientFirst', status: 'Part-time', salary: 'P 60K - 110K', category: 'Sales'),
  ];

  List<Job> _filteredJobs = [];
  final List<String> _categories = ['IT', 'Marketing', 'Finance', 'Design', 'Sales'];
  String? _selectedCategory;
  String _username = "Patrick";

  @override
  void initState() {
    super.initState();
    _filteredJobs = List.from(_jobs);
  }

  void _filterJobs(String query) {
    setState(() {
      _filteredJobs = _jobs.where((job) {
        final matchesQuery = query.isEmpty ||
            job.title.toLowerCase().contains(query.toLowerCase()) ||
            job.company.toLowerCase().contains(query.toLowerCase());
        final matchesCategory = _selectedCategory == null || job.category == _selectedCategory;
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/blue_background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'JobQuest',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 4.0, color: Colors.black45, offset: Offset(2, 2))],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.14,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
                      radius: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Hi, $_username',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: 28),
                    SizedBox(width: 16),
                    Icon(Icons.message, color: Colors.white, size: 28),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterJobs,
                      decoration: InputDecoration(
                        labelText: 'Search for jobs',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 20),
                    child: Text(
                      'Categories',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: _categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(category),
                              selected: _selectedCategory == category,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedCategory = selected ? category : null;
                                  _filterJobs(_searchController.text);
                                });
                              },
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(color: _selectedCategory == category ? Colors.white : Colors.blue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredJobs.length,
                      itemBuilder: (context, index) {
                        final job = _filteredJobs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Card(
                            color: Colors.blue[50],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 8,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              leading: CircleAvatar(backgroundImage: AssetImage('assets/images/company_icon.jpg')),
                              title: Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(job.company, style: TextStyle(fontSize: 14, color: Colors.grey)),
                              trailing: Text(
                                job.salary,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}