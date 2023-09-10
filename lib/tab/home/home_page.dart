import 'package:flutter/material.dart';

import 'home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //홈 모델 불러옴
    final model = HomeModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHPL'),
      ),
      body: Center(
        //가운데로 정함
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), //여백 주기
            const Text(
              'P.H.P.L.에 오신 것을 환영합니다.', //글자 크기 변경
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), //여백 주기
            const Text('사진과 동영상을 보려면 팔로우하세요'),
            const SizedBox(height: 20), //여백 주기
            Card(//바깥쪽 패딩 주려면 여기에 주고, 안쪽에주려면 Column에 주기
              elevation: 4.0,//Card에 그림자 주기
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(//프로필 사진 바꾸기
                        onTap: () async {
                          await model.updateProfileImage();

                          setState(() {//StatelessWidget이면 화면 갱신 못해서 위 바꿔주고 사용
                            },
                          );
                          },
                        child: CircleAvatar(//동그라미 사진
                          backgroundImage: NetworkImage(model.getProfileImageUrl()),
                        ),

                      ),
                    ),
                    const SizedBox(height: 8), //패딩 8 간격 주기
                    Text(model.getEmail(),
                      style: const TextStyle(
                          //진하게
                          fontWeight: FontWeight.bold),
                    ),
                    Text(model.getNickName()),
                    const SizedBox(height: 8), //패딩 8 간격 주기'
                    Row(
                      mainAxisSize: MainAxisSize.min,//row size 줄이기
                      mainAxisAlignment: MainAxisAlignment.center,//가운데 정렬
                      children: [
                        Image.network(//url 이미지 삽입
                          'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjdfNDQg%2FMDAxNjc0ODA4MTkxNTc4.gVATRXlifbUc0AJuGa0DQJr5jdw1eGk0JEFgtVbJRDUg.bRMYmlx-SZrkUKQ4-a82clnY9o0b7_FhlLX-SY7Fws8g.PNG.safeway1104%2F2023-01-27_17%253B27%253B30.PNG&type=sc960_832',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,//크기 고정
                        ),
                        const SizedBox(width: 4), //사진 사이 간격주기
                        Image.network(
                          'https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/28/111500268.2.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4), //사진 사이 간격주기
                        Image.network(
                          'https://cdn.ksilbo.co.kr/news/photo/202206/938335_532280_3749.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), //패딩 8 간격 주기
                    const Text('친구'),
                    const SizedBox(height: 8), //패딩 8 간격 주기
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('팔로우'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
