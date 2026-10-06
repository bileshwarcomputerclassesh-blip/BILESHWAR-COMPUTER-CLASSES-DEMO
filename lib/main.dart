import 'package:flutter/material.dart';

void main() {
  runApp(const BileshwarApp());
}

class Course {
  final String name;
  final String duration;
  final String fee;
  final String details;

  const Course({
    required this.name,
    required this.duration,
    required this.fee,
    required this.details,
  });
}

const List<Course> courses = [
  Course(
    name: 'CCC – Computer Course',
    duration: '3 Months',
    fee: '₹2,500',
    details: 'Computer basics, Internet, MS Office and practical training.',
  ),
  Course(
    name: 'Basic Computer Course',
    duration: '2 Months',
    fee: '₹1,999',
    details: 'Computer fundamentals, typing, files, folders and Internet.',
  ),
  Course(
    name: 'Tally Prime',
    duration: '3 Months',
    fee: '₹3,500',
    details: 'Accounting basics, Tally Prime, GST and practical work.',
  ),
  Course(
    name: 'Advanced Excel',
    duration: '2 Months',
    fee: '₹2,500',
    details: 'Excel formulas, functions, charts, reports and advanced tools.',
  ),
  Course(
    name: 'DTP Course',
    duration: '3 Months',
    fee: '₹3,000',
    details: 'Graphic design and desktop publishing practical training.',
  ),
  Course(
    name: 'Computer Hardware',
    duration: '3 Months',
    fee: '₹4,000',
    details: 'Computer hardware, installation, troubleshooting and maintenance.',
  ),
  Course(
    name: 'Programming Course',
    duration: '6 Months',
    fee: '₹5,999',
    details: 'Programming fundamentals, logic building and project practice.',
  ),
];

class BileshwarApp extends StatelessWidget {
  const BileshwarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bileshwar Computer Classes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH SCREEN =================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF42A5F5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 90,
            ),
            SizedBox(height: 20),
            Text(
              'BILESHWAR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'COMPUTER CLASSES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Learn Today • Build Your Tomorrow',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HOME SCREEN =================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bileshwar Computer Classes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1565C0),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 12),
                Text(
                  'Learn. Grow. Succeed.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore our computer courses and send your enquiry.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Our Courses',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...courses.map(
            (course) => CourseCard(course: course),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.phone),
              ),
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Course and admission enquiry',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showContact(context);
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.info_outline),
              ),
              title: const Text(
                'About Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'About Bileshwar Computer Classes',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showAbout(context);
              },
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Demo APK • Bileshwar Computer Classes',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showContact(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call / Enquiry'),
                subtitle: Text(
                  'Contact number will be added after approval',
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                subtitle: Text('Mahuva, Gujarat'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showAbout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'About Us',
          ),
          content: const Text(
            'This student-focused demo lets students explore available computer courses and submit a course enquiry.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

// ================= COURSE CARD =================

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: const CircleAvatar(
          radius: 27,
          child: Icon(
            Icons.computer,
          ),
        ),
        title: Text(
          course.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${course.duration} • ${course.fee}',
        ),
        trailing: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetails(
                  course: course,
                ),
              ),
            );
          },
          child: const Text(
            'View',
          ),
        ),
      ),
    );
  }
}

// ================= COURSE DETAILS =================

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Course Details',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.school,
              size: 75,
              color: Color(0xFF1565C0),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            course.name,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.schedule,
            ),
            title: const Text(
              'Duration',
            ),
            subtitle: Text(
              course.duration,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.currency_rupee,
            ),
            title: const Text(
              'Demo Fees',
            ),
            subtitle: Text(
              course.fee,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Course Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            course.details,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnquiryScreen(
                      course: course,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit_note,
              ),
              label: const Text(
                'ENQUIRY NOW',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= ENQUIRY SCREEN =================

class EnquiryScreen extends StatefulWidget {
  final Course course;

  const EnquiryScreen({
    super.key,
    required this.course,
  });

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void submitEnquiry() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 55,
          ),
          title: const Text(
            'Enquiry Submitted!',
          ),
          content: Text(
            'Thank you, ${nameController.text}!\n\n'
            'Course: ${widget.course.name}\n\n'
            'Your demo enquiry has been submitted successfully.',
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Course Enquiry',
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              widget.course.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                prefixIcon: Icon(
                  Icons.person,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Enter student name';
                }

                return null;
              },
            ),

            const SizedBox(height: 14),

            TextFormField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                prefixIcon: Icon(
                  Icons.phone,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.replaceAll(
                          RegExp(r'[^0-9]'),
                          '',
                        ).length <
                        10) {
                  return 'Enter valid mobile number';
                }

                return null;
              },
            ),

            const SizedBox(height: 14),

            TextFormField(
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message / Query',
                prefixIcon: Icon(
                  Icons.message,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: submitEnquiry,
                icon: const Icon(
                  Icons.send,
                ),
                label: const Text(
                  'SEND ENQUIRY',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
