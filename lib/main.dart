import 'package:flutter/material.dart';
import 'package:team_10/api_services.dart';
import 'package:team_10/product_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Product>? _productModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = (await ApiService().getProduct());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;

    return Scaffold(
      appBar: AppBar(
      ),
      body: _productModel == null || _productModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _productModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(_productModel![index].id.toString()),
                    SizedBox(
                      width: c_width,
                      child: Column(
                        children: [
                          Text(_productModel![index].name ,
                            textAlign: TextAlign.center,
                          ),
                          Text(_productModel![index].description ,
                            textAlign: TextAlign.center,
                          ),
                          Text(_productModel![index].price.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                  width: 200,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
