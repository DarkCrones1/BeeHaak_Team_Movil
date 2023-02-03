import 'package:bee_haak_app/widget/profile/image_profile.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      // backgroundColor: Colors.yellow[800],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://www.zooplus.es/magazine/wp-content/uploads/2022/05/Cuanto-pesa-un-gato-2.jpeg'),
                fit: BoxFit.cover
                )
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: CircleImageProfile(),
            )
            // Card(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8)),
            //   shadowColor: Colors.pinkAccent,
            //   color: Colors.amber,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //         child: Text(
            //           'far far away',
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 5,
            //       ),
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 30),
            //         child: Text('jqqwiouoqweoqweuoqyeqiweyiqewybqiweybqwieyqiweyqe'),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
