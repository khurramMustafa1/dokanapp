import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/privacylist.dart';
import 'package:internshipproject2/services/privacy.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  Privacylist? privacylist;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrivacy();
  }

  Future<void> fetchPrivacy() async {
    final result = await PrivacyService.getPrivacyPolicies();
    setState(() {
      privacylist = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Privacy Policies")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : privacylist == null || privacylist!.policies!.isEmpty
          ? Center(child: Text("No Privacy Policies Found"))
          : ListView.builder(
        itemCount: privacylist!.policies!.length,
        itemBuilder: (context, index) {
          final policy = privacylist!.policies![index];
          return ListTile(
            title: Text(policy.title ?? "No Title"),
            subtitle: Text(policy.description ?? "No Description"),
          );
        },
      ),
    );
  }
}
