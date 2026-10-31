import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picsum/models/photo_model.dart';
import 'package:picsum/providers/gallery_provider.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GalleryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picsum Gallery'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          if (provider.isLoading && provider.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage.isNotEmpty && provider.photos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load photos'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => provider.fetchPhotos(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.fetchPhotos(),
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: provider.photos.length,
              itemBuilder: (context, index) {
                final photo = provider.photos[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailPage(photo: photo),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      photo.downloadUrl ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image));
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Simple Fullscreen Photo View
class PhotoDetailPage extends StatelessWidget {
  final PhotoModel photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.author ?? 'Photo'),
      ),
      body: Center(
        child: Image.network(
          photo.downloadUrl ?? '',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.broken_image, size: 50));
          },
        ),
      ),
    );
  }
}
