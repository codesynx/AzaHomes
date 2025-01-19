import 'package:flutter/cupertino.dart';
import '../models/apartment_model.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
        middle: Text(
          'Чаты',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CupertinoTextField(
                  placeholder: 'Поиск по чатам',
                  placeholderStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CupertinoColors.systemGrey,
                    fontSize: 16,
                  ),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.systemGrey,
                      size: 20,
                    ),
                  ),
                  decoration: null,
                ),
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  // Important Updates Section
                  _buildChatItem(
                    icon: CupertinoIcons.bell_fill,
                    iconBackground: const Color(0xFF007AFF),
                    title: 'Важное',
                    subtitle: 'В версии 1.1.16:\n-Обновлена иконка профиля в TabBar.',
                    time: '31.10',
                    unreadCount: 3,
                  ),

                  // Activity Updates Section
                  _buildChatItem(
                    icon: CupertinoIcons.clock_fill,
                    iconBackground: const Color(0xFF34C759),
                    title: 'Активность',
                    subtitle: 'Здесь вы найдете все обновления и уведомления о ваших бронированиях и объявлениях.',
                    time: '19.09',
                    unreadCount: 1,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Недавние',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: CupertinoColors.systemGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Recent Chats
                  _buildChatItem(
                    imageUrl: 'assets/images/owner1.png',
                    title: 'Асланбек',
                    subtitle: 'Спасибо за бронирование! Жду вас...',
                    time: '14:28',
                    unreadCount: 2,
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner2.jpg',
                    title: 'Айсултан',
                    subtitle: 'Хорошо, договорились!',
                    time: 'Вчера',
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner3.jpg',
                    title: 'Абильмансур',
                    subtitle: 'Добрый день! Квартира свободна...',
                    time: '25.10',
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner4.jpg',
                    title: 'Азамат',
                    subtitle: 'Да, конечно, можете заехать...',
                    time: '23.10',
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner5.jpg',
                    title: 'Мейиржан',
                    subtitle: 'Отлично! Ключи можете забрать...',
                    time: '20.10',
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner6.jpg',
                    title: 'Жанерке',
                    subtitle: 'Добрый вечер! Да, все верно...',
                    time: '19.10',
                  ),
                  _buildChatItem(
                    imageUrl: 'assets/images/owner7.jpg',
                    title: 'Рахат',
                    subtitle: 'Квартира готова к заселению...',
                    time: '18.10',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem({
    String? imageUrl,
    IconData? icon,
    Color? iconBackground,
    required String title,
    required String subtitle,
    required String time,
    int? unreadCount,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF2F2F7),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBackground ?? const Color(0xFFF2F2F7),
              shape: BoxShape.circle,
              image: imageUrl != null
                  ? DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: icon != null
                ? Icon(
                    icon,
                    color: CupertinoColors.white,
                    size: 24,
                  )
                : imageUrl == null
                    ? const Icon(
                        CupertinoIcons.person_fill,
                        color: CupertinoColors.systemGrey2,
                        size: 24,
                      )
                    : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    if (unreadCount != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 