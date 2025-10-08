// First, add these dependencies to your pubspec.yaml:
/*
dependencies:
  flutter:
    sdk: flutter
  syncfusion_flutter_pdfviewer: ^22.1.34  # For PDF viewing
  image_editor: ^1.3.0  # For photo editing
  video_editor: ^1.5.2  # For video editing
  file_picker: ^5.2.10  # For picking files
  path_provider: ^2.0.15
*/

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:image_editor/image_editor.dart';
import 'package:video_editor/video_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';  // Add this import for File class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multimedia Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;
  String? _pdfPath;
  String? _imagePath;
  String? _videoPath;

  // Function to pick PDF file
  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfPath = result.files.single.path;
      });
    }
  }

  // Function to pick image file
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imagePath = result.files.single.path;
      });
    }
  }

  // Function to pick video file
  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        _videoPath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),  // Light gray background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Modern App',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Explore your modern app experience',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              _buildBody(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Get Started'),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Color(0xFF007AFF),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildPDFViewer();
      case 1:
        return _buildPhotoEditor();
      case 2:
        return _buildVideoEditor();
      default:
        return const Center(child: Text('Something went wrong'));
    }
  }

  Widget _buildPDFViewer() {
    if (_pdfPath == null) {
      return Center(
        child: ElevatedButton(
          onPressed: _pickPDF,
          child: const Text('Pick PDF File'),
        ),
      );
    }
    return SfPdfViewer.file(File(_pdfPath!));  // File class is now imported
  }

  Widget _buildPhotoEditor() {
    if (_imagePath == null) {
      return Center(
        child: ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Pick Image File'),
        ),
      );
    }
    // Implement photo editing UI here
    return Column(
      children: [
        Image.file(File(_imagePath!)),  // File class is now imported
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement crop functionality
              },
              child: const Text('Crop'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement filter functionality
              },
              child: const Text('Filters'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement adjust functionality
              },
              child: const Text('Adjust'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVideoEditor() {
    if (_videoPath == null) {
      return Center(
        child: ElevatedButton(
          onPressed: _pickVideo,
          child: const Text('Pick Video File'),
        ),
      );
    }
    // Implement video editing UI here
    return Column(
      children: [
        // Video preview widget would go here
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement trim functionality
              },
              child: const Text('Trim'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement crop functionality
              },
              child: const Text('Crop'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement effects functionality
              },
              child: const Text('Effects'),
            ),
          ],
        ),
      ],
    );
  }
}