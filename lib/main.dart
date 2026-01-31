import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soum Bora CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B8FC4),
          primary: const Color(0xFF9B8FC4),
        ),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
    );
  }
}

class CVHomePage extends StatelessWidget {
  const CVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F5F0), Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Wavy background at top
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 100,
                width: double.infinity,
                color: const Color(0xFF9B8FC4),
              ),
            ),
            // Rest of content centered
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Transform.translate(
                    offset: const Offset(0, -30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile picture without white background
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/e20221195_copy.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF9B8FC4,
                                    ).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Color(0xFF9B8FC4),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'SOUM BORA',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '4th Year Student - GTR',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Welcome to my CV! Come explore my education, experience, and skills',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CVDetailPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B8FC4),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Explore my CV',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CVDetailPage extends StatelessWidget {
  const CVDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            pinned: true,
            backgroundColor: const Color(0xFF9B8FC4),
            foregroundColor: Colors.white, 
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'MY CV',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section
                  _buildSection(
                    'Profile',
                    child: const Text(
                      'An engineer majoring in Telecommunications and Network engineering (GTR) at Institute of Technology of Cambodia (ITC). I am energetic, hardworking, honest, socialize, responsible and reliable.\nI am looking for learning something new to improve my skills and knowledge.',
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Education Section
                  _buildSection(
                    'Education',
                    child: Column(
                      children: [
                        _buildEducationItem(
                          'Graduated Bac.II Cheasim Somthor Muk Highschool',
                          '2020 - 2021',
                        ),
                        const SizedBox(height: 12),
                        _buildEducationItem(
                          'Arduino training short course at ITC',
                          '2024',
                        ),
                        const SizedBox(height: 12),
                        _buildEducationItem(
                          '4th-year student majoring in Telecommunications and Network engineering (GTR)',
                          'Present',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Experience Section
                  _buildSection(
                    'Experience',
                    child: Column(
                      children: [
                        _buildExperienceItem(
                          'Work on a project called Alarm clock',
                          '2024',
                        ),
                        const SizedBox(height: 12),
                        _buildExperienceItem('Internship at EDC', '2025'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Skills Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildSection(
                          'Soft Skill',
                          child: Column(
                            children: [
                              _buildSkillChip('Communication'),
                              const SizedBox(height: 8),
                              _buildSkillChip('Creativity'),
                              const SizedBox(height: 8),
                              _buildSkillChip('Management'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSection(
                          'Hard Skill',
                          child: Column(
                            children: [
                              _buildSkillChip('Arduino Programming'),
                              const SizedBox(height: 8),
                              _buildSkillChip('Programming: C, C++'),
                              const SizedBox(height: 8),
                              _buildSkillChip('Flutter'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Language Section
                  _buildSection(
                    'Language',
                    child: Column(
                      children: [
                        _buildLanguageItem('Khmer', 'Native'),
                        const SizedBox(height: 8),
                        _buildLanguageItem('English', 'Intermediate'),
                        const SizedBox(height: 8),
                        _buildLanguageItem('French', 'Basic'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contact Section
                  _buildSection(
                    'Contact me',
                    backgroundColor: const Color(0xFFD4E9F0),
                    child: Column(
                      children: [
                        _buildContactItem(Icons.phone, '+855 89 822 921'),
                        const SizedBox(height: 12),
                        _buildContactItem(Icons.email, 'soumbora929@gmail.com'),
                        const SizedBox(height: 12),
                        _buildContactItem(
                          Icons.location_on,
                          'Sangkat Tik L\'aak II, Toul Kork, Phnom Penh',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title, {
    required Widget child,
    Color? backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF5F5F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildEducationItem(String text, String year) {
    return Row(
      children: [
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(year, style: const TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildExperienceItem(String text, String year) {
    return Row(
      children: [
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFD4E9F0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(year, style: const TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E9F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: const TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLanguageItem(String language, String level) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E9F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            '($level)',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}

// Custom clipper for wavy header
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);

    var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    var secondStart = Offset(size.width * 3 / 4, size.height - 40);
    var secondEnd = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
