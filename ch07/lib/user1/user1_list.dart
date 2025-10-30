import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_register.dart';
import 'package:ch07/user1/user1_modify.dart'; // ← 수정 화면 임포트 (경로 맞춰주세요)
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/material.dart';

class User1List extends StatefulWidget {
  const User1List({super.key});

  @override
  State<User1List> createState() => _User1ListState();
}

class _User1ListState extends State<User1List> {
  final service = User1Service();

  late Future<List<User1>> futureUserList;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    setState(() {
      futureUserList = service.getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 목록')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 등록 화면 이동 → 완료 후 목록 갱신
          final created = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const User1Register()),
          );
          if (created == true) {
            _reload();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<User1>>(
        future: futureUserList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('에러발생 : ${snapshot.error}'));
          }
          final userList = snapshot.data ?? [];

          if (userList.isEmpty) {
            return const Center(child: Text('등록된 사용자 없음'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              _reload();
              // future가 갱신될 때까지 잠깐 대기
              await futureUserList;
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                final avatarText =
                (user.name.isNotEmpty) ? user.name.characters.first : '?';

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(avatarText)),
                    title: Text('${user.name} (${user.userid})'),
                    subtitle: Text('${user.age}세 (${user.birth})'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            final modified = await Navigator.push<bool>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => User1Modify(userid: user.userid),
                              ),
                            );
                            if (modified == true) {
                              _reload();
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final ok = await showDialog<bool>(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('삭제 확인'),
                                content: Text('${user.name}을(를) 삭제하시겠어요?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('취소'),
                                  ),
                                  FilledButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('삭제'),
                                  ),
                                ],
                              ),
                            );
                            if (ok == true) {
                              try {
                                // 주의: 서버가 204 No Content를 주면 body 파싱하지 말기!
                                final success = await service.deleteUser(user.userid);
                                if (success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('삭제되었습니다.')),
                                  );
                                  _reload();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('삭제 실패')),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('삭제 중 오류: $e')),
                                );
                              }
                            }
                          },
                        ),
                      ],
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
