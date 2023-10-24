import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/user_manager.dart';
import 'package:kirna_store_app/feature/user_details/presentation/widget/input_widget.dart';
import 'package:provider/provider.dart';

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({super.key});

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  final formKeyNew = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    print(
        "userfirstname ${FirebaseAuth.instance.currentUser!.displayName} ${FirebaseAuth.instance.currentUser!.phoneNumber}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          FirebaseAuth.instance.currentUser!.displayName ?? "";
      _phoneController.text =
          FirebaseAuth.instance.currentUser!.phoneNumber ?? "";
      _addressController.text =
          context.read<LocationManagerNotifer>().currentAddress;
      _landmarkController.text =
          context.read<LocationManagerNotifer>().place.subAdministrativeArea ??
              "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize:
          0.58, // The initial size of the bottom sheet (0.5 means half of the screen)
      minChildSize:
          0.1, // The minimum size to which it can be dragged (0.1 means 10% of the screen)
      maxChildSize:
          0.75, // The maximum size to which it can be dragged (1.0 means the full screen)
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        Size size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          controller: scrollController,
          child: Form(
            key: formKeyNew,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(size.height / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter complete address",
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close))
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: InputTextWidget(
                    labelText: 'Name',
                    editingController: _nameController,
                    type: TextInputType.text,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: InputTextWidget(
                    labelText: 'Enter Complete Address',
                    editingController: _addressController,
                    type: TextInputType.text,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: InputTextWidget(
                    labelText: 'Street / Society / Landmark',
                    editingController: _landmarkController,
                    type: TextInputType.text,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: InputTextWidget(
                    labelText: 'Confirm Phone Number',
                    editingController: _phoneController,
                    type: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height / 80))),
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () async {
                      if (formKeyNew.currentState!.validate()) {

                       await context
                            .read<LocationManagerNotifer>()
                            .saveUserAddressToFirebase(
                                userData: UserModelData(
                                  locationPermission: context
                                  .read<LocationManagerNotifer>().serviceEnabled,
                                  userId:FirebaseAuth
                                  .instance.currentUser!.uid ,
                                    name: _nameController.text,
                                    email: FirebaseAuth
                                            .instance.currentUser!.email ??
                                        "",
                                    phoneNumber: _phoneController.text,
                                    logitude:    context
                                    .read<LocationManagerNotifer>().currentPosition.longitude,
                                    latitude:context
                                    .read<LocationManagerNotifer>().currentPosition.latitude ,
                                    landMark: _landmarkController.text,
                                    address: _addressController.text,
                                    placeMark: context
                                        .read<LocationManagerNotifer>()
                                        .place));
                    
                    
                     
                     
                                      }
                    },
                    child:   context
                    .read<LocationManagerNotifer>().locationNotiferState==LocationManagerNotiferState.loading?const CircularProgressIndicator():  const Text("Confirm  Address"))
              ],
            ),
          ),
        );
      },
    );
  }
}
