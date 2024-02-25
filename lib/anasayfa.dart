import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfConroller =TextEditingController(); //Bu texteki veri okumak istediğim yapı
    String alinanVeri= "" ;
    String resimAdi="mutlu.png";
    bool switchKontrol=false;
  bool checkboxKontrol=false;
  int radioDeger=0;
  bool progresKontrol=false;
  double ilerlem=30.0;
  var tfSaat =TextEditingController();
  var tfTarih =TextEditingController();
  var ulkelerListesi= <String>[];
  String secilenUlke="Türkiye";
  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Ameika");
    ulkelerListesi.add("Rusya");
    ulkelerListesi.add("Brazilya");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Widgets"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField
                  (controller: tfConroller,
                  decoration:const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanVeri =tfConroller.text;
                });
              },

                  child: Text("Verii al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi="mutlu.png";
                    });
                  },

                      child: Text("Resim 1")),
                  Image.asset("resimler/${resimAdi}"),
                  //Image.network("https://hips.hearstapps.com/hmg-prod/images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg?crop=0.8888888888888888xw:1xh;center,top&resize=1200:*"),

                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi="uzgun.png";

                    });
                  },

                      child: Text("Resim 2")),

                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: SwitchListTile(
                      title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (veri){
                          setState(() {
                            switchKontrol=veri;
                          });
                        }
                    ),
                  ),
                  SizedBox(width: 200,
                    child: CheckboxListTile(
                        title: const Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (veri){
                          setState(() {
                            checkboxKontrol=veri!;
                          });
                        }
                    ),
                  ),
                 ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 200,
                      child: RadioListTile(
                          title: const Text("Barcelona"),
                          value: 1,
                          groupValue: radioDeger,
                          onChanged: (veri){
                            setState(() {
                              radioDeger=veri!;
                            });
                          }
                      ),
                    ),
                    SizedBox(width: 200,
                      child: RadioListTile(
                          title: const Text("Real Madrid"),
                          value: 2,
                          groupValue: radioDeger,
                          onChanged: (veri){
                            setState(() {
                              radioDeger=veri!;

                            });
                          }
                      ),
                    ),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresKontrol=true;

                    });
                  },
                      child: Text("Basla")),
                  Visibility(visible:progresKontrol ,child: const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresKontrol=false;
                    });},
                      child: Text("Dur")),
                ],
              ),
                Text(ilerlem.toInt().toString()),
              Slider(max: 100.0,min: 0.0,
                  value: ilerlem, onChanged: (veri){
                  setState(() {
                    ilerlem=veri;
                  });
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120,
                    child: TextField(controller: tfSaat, decoration:const InputDecoration(hintText: "Saat"),
                    ),
                  ),IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                        .then((value) => {
                      tfSaat.text="${value!.hour} : ${value!.minute}"
                    });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(width: 120,
                    child: TextField(controller: tfTarih, decoration:const InputDecoration(hintText: "Tarih"),
                    ),
                  ),IconButton(onPressed: (){
                    showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2024))
                        .then((value) => {
                      tfTarih.text="${value!.day} / ${value!.month}  / ${value!.year}"
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],
              ),
              DropdownButton(
                value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke){
                    return DropdownMenuItem(value: ulke,child: Text(ulke),)
                  }).toList(),
                  onChanged: (veri){
                  setState(() {
                    secilenUlke=veri!;
                  });
                  }
              ),
              GestureDetector(
                onTap: (){
                  print("Container Tek Tıklandi");
                },
                  onDoubleTap: (){
                    print("Container cift Tıklandi");
                  },
                  onLongPress: (){
                    print("Container üzerine uzun basildi");

                  },
                  child: Container(width: 200,height: 200,color: Colors.red,));
              ElevatedButton(onPressed: (){
                print("Switch Durum: $switchKontrol");
                print("Checkbox Durum: $checkboxKontrol");
                print("Radio Durum: $radioDeger");
                print("Slider Durum: $ilerlem");
                print("Ülke Durum: $secilenUlke");



              },
                  child: Text("Göster")),
            ],

          ),
        ),
      ),


    );
  }
}
