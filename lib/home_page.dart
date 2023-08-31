import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/data_model.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController image = TextEditingController();
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.amber),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: image,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    FirebaseServices().createData(
                      model: DataModel(
                        data: controller.text,
                        image: image.text,
                      ),
                    );
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseServices().getData(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Column(
                            children: [
                              Image.network(snapshot.data?[index].image ?? ''),
                              Text(
                                snapshot.data?[index].data ?? '',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.amber,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  FirebaseServices().removeFromDataBase(
                                      snapshot.data?[index].id ?? '');
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                  weight: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
