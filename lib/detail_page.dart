import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000),
      lowerBound: 0,
      upperBound: 1,
      reverseDuration: Duration(milliseconds: 10000),
    );
    super.initState();
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Map s = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/bg.jpeg").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Text(
              "${s['name']}",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            RotationTransition(
              turns: animationController,
              child: Hero(
                tag: s['name'],
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: Image.asset(
                        "${s['img']}",
                        fit: BoxFit.cover,
                      ).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(15),
              // height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff252648).withOpacity(0.7),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(
                "${s['des']}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        // child: Image.asset(s['img'],height: 200,width: 200,),
      ),
    );
  }
}
