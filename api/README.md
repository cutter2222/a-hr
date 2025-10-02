# Документация API

API для работы с базой данных пользователей, наград, событий, миссий и других сущностей. Использует REST, HTTPS и JSON, соответствующие формату Supabase. Методы описаны кратко с примерами.

## Аутентификация

Добавьте в запросы заголовки:  
- `Authorization: Bearer YOUR_JWT_TOKEN`  
- `apikey: YOUR_API_KEY`  
- `Content-Type: application/json` (для `POST`/`PATCH`)

Базовый URL: `https://localhost/rest/v1/`

## Методы API

### Пользователи (users)

**GET /rest/v1/users?id=eq.<user_id>&select=id,email,first_name,ranks(title)**  
Получает данные пользователя по ID.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/users?select=id,email,first_name,ranks(title)&id=eq.123e4567-e89b-12d3-a456-426614174000&limit=1' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": "123e4567-e89b-12d3-a456-426614174000", "email": "user@example.com", "first_name": "Иван", "ranks": {"title": "Новичок"}}]
```

**POST /rest/v1/users**  
Добавляет нового пользователя.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/users' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"id": "123e4567-e89b-12d3-a456-426614174000", "email": "user@example.com", "first_name": "Иван"}'
```  
Ответ:  
```json
{"id": "123e4567-e89b-12d3-a456-426614174000", "email": "user@example.com", "first_name": "Иван"}
```

**PATCH /rest/v1/users?id=eq.<user_id>**  
Обновляет данные пользователя.  
Пример:  
```bash
curl -X PATCH 'https://localhost/rest/v1/users?id=eq.123e4567-e89b-12d3-a456-426614174000' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"first_name": "Алексей", "city": "Москва"}'
```  
Ответ:  
```json
{"id": "123e4567-e89b-12d3-a456-426614174000", "first_name": "Алексей", "city": "Москва"}
```

**DELETE /rest/v1/users?id=eq.<user_id>**  
Удаляет пользователя.  
Пример:  
```bash
curl -X DELETE 'https://localhost/rest/v1/users?id=eq.123e4567-e89b-12d3-a456-426614174000' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
{}
```

### Награды (user_rewards)

**GET /rest/v1/user_rewards?user_id=eq.<user_id>&select=id,rewards(name,description),earned_at**  
Получает награды пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/user_rewards?select=id,rewards(name,description),earned_at&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5&offset=0' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "rewards": {"name": "Золотая медаль", "description": "За успехи"}, "earned_at": "2025-10-02T10:00:00+00:00"}]
```

**POST /rest/v1/user_rewards**  
Добавляет награду пользователю.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/user_rewards' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "reward_id": 1, "source": "mission"}'
```  
Ответ:  
```json
{"id": 2, "user_id": "123e4567-e89b-12d3-a456-426614174000", "reward_id": 1, "source": "mission", "earned_at": "2025-10-02T15:00:00+00:00"}
```

**DELETE /rest/v1/user_rewards?id=eq.<reward_id>&user_id=eq.<user_id>**  
Удаляет награду пользователя.  
Пример:  
```bash
curl -X DELETE 'https://localhost/rest/v1/user_rewards?id=eq.1&user_id=eq.123e4567-e89b-12d3-a456-426614174000' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
{}
```

### События (events)

**GET /rest/v1/events?user_id=eq.<user_id>&select=id,name,description,status**  
Получает события пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/events?select=id,name,description,status&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=3&order=created_at.desc' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Встреча", "description": "Собрание", "status": "pending"}]
```

**POST /rest/v1/events**  
Создаёт событие.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/events' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "name": "Новое событие", "description": "Описание", "status": "pending"}'
```  
Ответ:  
```json
{"id": 2, "user_id": "123e4567-e89b-12d3-a456-426614174000", "name": "Новое событие", "description": "Описание", "status": "pending"}
```

**PATCH /rest/v1/events?id=eq.<event_id>**  
Обновляет событие.  
Пример:  
```bash
curl -X PATCH 'https://localhost/rest/v1/events?id=eq.1' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"status": "completed", "is_completed": true}'
```  
Ответ:  
```json
{"id": 1, "status": "completed", "is_completed": true}
```

### Миссии (user_missions)

**GET /rest/v1/user_missions?user_id=eq.<user_id>&select=mission_id,missions(title,description),status**  
Получает миссии пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/user_missions?select=mission_id,missions(title,description),status&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"mission_id": 1, "missions": {"title": "Первая миссия", "description": "Описание"}, "status": "pending"}]
```

**POST /rest/v1/user_missions**  
Добавляет миссию пользователю.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/user_missions' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "mission_id": 1, "status": "pending"}'
```  
Ответ:  
```json
{"id": 1, "user_id": "123e4567-e89b-12d3-a456-426614174000", "mission_id": 1, "status": "pending"}
```

### Уровни (levels)

**GET /rest/v1/levels?select=level,xp_to_next**  
Получает данные об уровнях.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/levels?select=level,xp_to_next&limit=10' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"level": 1, "xp_to_next": 100}, {"level": 2, "xp_to_next": 200}]
```

**POST /rest/v1/levels**  
Добавляет новый уровень.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/levels' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"level": 3, "xp_to_next": 300}'
```  
Ответ:  
```json
{"level": 3, "xp_to_next": 300}
```

### Журнал (logbook)

**GET /rest/v1/logbook?user_id=eq.<user_id>&select=id,entity_type,skill_points_change,xp_points_change**  
Получает записи журнала пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/logbook?select=id,entity_type,skill_points_change,xp_points_change&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "entity_type": "mission", "skill_points_change": 10, "xp_points_change": 50}]
```

**POST /rest/v1/logbook**  
Добавляет запись в журнал.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/logbook' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "entity_type": "mission", "xp_points_change": 100}'
```  
Ответ:  
```json
{"id": 2, "user_id": "123e4567-e89b-12d3-a456-426614174000", "entity_type": "mission", "xp_points_change": 100}
```

### Требуемые ветки для миссий (mission_required_branches)

**GET /rest/v1/mission_required_branches?mission_id=eq.<mission_id>&select=required_branch_id,branches(name)**  
Получает требуемые ветки для миссии.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/mission_required_branches?select=required_branch_id,branches(name)&mission_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"required_branch_id": 1, "branches": {"name": "Разработка"}}]
```

**POST /rest/v1/mission_required_branches**  
Добавляет требуемую ветку для миссии.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/mission_required_branches' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"mission_id": 1, "required_branch_id": 2}'
```  
Ответ:  
```json
{"id": 1, "mission_id": 1, "required_branch_id": 2}
```

### Требуемые миссии (mission_required_missions)

**GET /rest/v1/mission_required_missions?mission_id=eq.<mission_id>&select=required_mission_id,missions(title)**  
Получает требуемые миссии.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/mission_required_missions?select=required_mission_id,missions(title)&mission_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"required_mission_id": 2, "missions": {"title": "Предыдущая миссия"}}]
```

**POST /rest/v1/mission_required_missions**  
Добавляет требуемую миссию.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/mission_required_missions' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"mission_id": 1, "required_mission_id": 2}'
```  
Ответ:  
```json
{"id": 1, "mission_id": 1, "required_mission_id": 2}
```

### Требуемые навыки для миссий (mission_required_skills)

**GET /rest/v1/mission_required_skills?mission_id=eq.<mission_id>&select=required_skill_id,skills(name),required_skill_points**  
Получает требуемые навыки для миссии.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/mission_required_skills?select=required_skill_id,skills(name),required_skill_points&mission_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"required_skill_id": 1, "skills": {"name": "Программирование"}, "required_skill_points": 50}]
```

**POST /rest/v1/mission_required_skills**  
Добавляет требуемый навык для миссии.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/mission_required_skills' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"mission_id": 1, "required_skill_id": 1, "required_skill_points": 50}'
```  
Ответ:  
```json
{"id": 1, "mission_id": 1, "required_skill_id": 1, "required_skill_points": 50}
```

### Награды за миссии (mission_rewards)

**GET /rest/v1/mission_rewards?mission_id=eq.<mission_id>&select=reward_id,rewards(name)**  
Получает награды за миссию.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/mission_rewards?select=reward_id,rewards(name)&mission_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"reward_id": 1, "rewards": {"name": "Золотая медаль"}}]
```

**POST /rest/v1/mission_rewards**  
Добавляет награду за миссию.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/mission_rewards' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"mission_id": 1, "reward_id": 1}'
```  
Ответ:  
```json
{"id": 1, "mission_id": 1, "reward_id": 1}
```

### Навыки миссий (mission_skills)

**GET /rest/v1/mission_skills?mission_id=eq.<mission_id>&select=skill_id,skills(name),skill_up_points**  
Получает навыки миссии.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/mission_skills?select=skill_id,skills(name),skill_up_points&mission_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"skill_id": 1, "skills": {"name": "Программирование"}, "skill_up_points": 10}]
```

**POST /rest/v1/mission_skills**  
Добавляет навык для миссии.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/mission_skills' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"mission_id": 1, "skill_id": 1, "skill_up_points": 10}'
```  
Ответ:  
```json
{"id": 1, "mission_id": 1, "skill_id": 1, "skill_up_points": 10}
```

### Миссии (missions)

**GET /rest/v1/missions?select=id,title,description,branch_id,branches(name)**  
Получает список миссий.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/missions?select=id,title,description,branch_id,branches(name)&limit=10&order=created_at.desc' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "title": "Первая миссия", "description": "Описание", "branch_id": 1, "branches": {"name": "Разработка"}}]
```

**POST /rest/v1/missions**  
Создаёт миссию.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/missions' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"title": "Новая миссия", "description": "Описание", "branch_id": 1, "xp_points": 100}'
```  
Ответ:  
```json
{"id": 2, "title": "Новая миссия", "description": "Описание", "branch_id": 1, "xp_points": 100}
```

### Требуемые миссии для рангов (rank_required_missions)

**GET /rest/v1/rank_required_missions?rank_id=eq.<rank_id>&select=required_mission_id,missions(title)**  
Получает требуемые миссии для ранга.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/rank_required_missions?select=required_mission_id,missions(title)&rank_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"required_mission_id": 1, "missions": {"title": "Первая миссия"}}]
```

**POST /rest/v1/rank_required_missions**  
Добавляет требуемую миссию для ранга.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/rank_required_missions' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"rank_id": 1, "required_mission_id": 1}'
```  
Ответ:  
```json
{"id": 1, "rank_id": 1, "required_mission_id": 1}
```

### Требуемые навыки для рангов (rank_required_skills)

**GET /rest/v1/rank_required_skills?rank_id=eq.<rank_id>&select=required_skill_id,skills(name),required_skill_points**  
Получает требуемые навыки для ранга.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/rank_required_skills?select=required_skill_id,skills(name),required_skill_points&rank_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"required_skill_id": 1, "skills": {"name": "Программирование"}, "required_skill_points": 50}]
```

**POST /rest/v1/rank_required_skills**  
Добавляет требуемый навык для ранга.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/rank_required_skills' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"rank_id": 1, "required_skill_id": 1, "required_skill_points": 50}'
```  
Ответ:  
```json
{"id": 1, "rank_id": 1, "required_skill_id": 1, "required_skill_points": 50}
```

### Награды за ранги (rank_rewards)

**GET /rest/v1/rank_rewards?rank_id=eq.<rank_id>&select=reward_id,rewards(name)**  
Получает награды за ранг.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/rank_rewards?select=reward_id,rewards(name)&rank_id=eq.1&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"reward_id": 1, "rewards": {"name": "Золотая медаль"}}]
```

**POST /rest/v1/rank_rewards**  
Добавляет награду за ранг.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/rank_rewards' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"rank_id": 1, "reward_id": 1}'
```  
Ответ:  
```json
{"id": 1, "rank_id": 1, "reward_id": 1}
```

### Ранги (ranks)

**GET /rest/v1/ranks?select=id,title,required_level**  
Получает список рангов.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/ranks?select=id,title,required_level&limit=10&order=order_index.asc' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "title": "Новичок", "required_level": 1}]
```

**POST /rest/v1/ranks**  
Создаёт новый ранг.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/ranks' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"title": "Мастер", "required_level": 5}'
```  
Ответ:  
```json
{"id": 2, "title": "Мастер", "required_level": 5}
```

### Редкость наград (reward_rarities)

**GET /rest/v1/reward_rarities?select=id,name,color**  
Получает список редкостей наград.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/reward_rarities?select=id,name,color&limit=10' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Легендарная", "color": "#FFD700"}]
```

**POST /rest/v1/reward_rarities**  
Добавляет новую редкость.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/reward_rarities' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Эпическая", "color": "#800080"}'
```  
Ответ:  
```json
{"id": 2, "name": "Эпическая", "color": "#800080"}
```

### Награды (rewards)

**GET /rest/v1/rewards?select=id,name,description,rarity_id,reward_rarities(name)**  
Получает список наград.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/rewards?select=id,name,description,rarity_id,reward_rarities(name)&limit=10' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Золотая медаль", "description": "За успехи", "rarity_id": 1, "reward_rarities": {"name": "Легендарная"}}]
```

**POST /rest/v1/rewards**  
Создаёт новую награду.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/rewards' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Серебряный кубок", "description": "За участие", "rarity_id": 2}'
```  
Ответ:  
```json
{"id": 2, "name": "Серебряный кубок", "description": "За участие", "rarity_id": 2}
```

### Категории магазина (shop_categories)

**GET /rest/v1/shop_categories?select=id,name,is_archived**  
Получает категории магазина.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/shop_categories?select=id,name,is_archived&limit=10&order=order_index.asc' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Оружие", "is_archived": false}]
```

**POST /rest/v1/shop_categories**  
Создаёт категорию магазина.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/shop_categories' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Броня", "order_index": 2}'
```  
Ответ:  
```json
{"id": 2, "name": "Броня", "order_index": 2}
```

### Товары магазина (shop_products)

**GET /rest/v1/shop_products?select=id,name,price_coins,cateogry_id,shop_categories(name)**  
Получает товары магазина.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/shop_products?select=id,name,price_coins,cateogry_id,shop_categories(name)&limit=10' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Меч", "price_coins": 100, "cateogry_id": 1, "shop_categories": {"name": "Оружие"}}]
```

**POST /rest/v1/shop_products**  
Добавляет товар в магазин.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/shop_products' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Щит", "price_coins": 50, "cateogry_id": 2}'
```  
Ответ:  
```json
{"id": 2, "name": "Щит", "price_coins": 50, "cateogry_id": 2}
```

### Навыки (skills)

**GET /rest/v1/skills?select=id,name,description**  
Получает список навыков.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/skills?select=id,name,description&limit=10' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Программирование", "description": "Кодирование"}]
```

**POST /rest/v1/skills**  
Добавляет новый навык.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/skills' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Дизайн", "description": "UI/UX"}'
```  
Ответ:  
```json
{"id": 2, "name": "Дизайн", "description": "UI/UX"}
```

### События пользователей (user_events)

**GET /rest/v1/user_events?user_id=eq.<user_id>&select=event_id,events(name,description)**  
Получает события пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/user_events?select=event_id,events(name,description)&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"event_id": 1, "events": {"name": "Встреча", "description": "Собрание"}}]
```

**POST /rest/v1/user_events**  
Добавляет событие пользователю.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/user_events' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "event_id": 1}'
```  
Ответ:  
```json
{"id": 1, "user_id": "123e4567-e89b-12d3-a456-426614174000", "event_id": 1}
```

### Покупки пользователей (user_purchases)

**GET /rest/v1/user_purchases?user_id=eq.<user_id>&select=id,shop_product_id,shop_products(name),price_coins**  
Получает покупки пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/user_purchases?select=id,shop_product_id,shop_products(name),price_coins&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "shop_product_id": 1, "shop_products": {"name": "Меч"}, "price_coins": 100}]
```

**POST /rest/v1/user_purchases**  
Добавляет покупку пользователя.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/user_purchases' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "shop_product_id": 1, "price_coins": 100}'
```  
Ответ:  
```json
{"id": 1, "user_id": "123e4567-e89b-12d3-a456-426614174000", "shop_product_id": 1, "price_coins": 100}
```

### Навыки пользователей (user_skills)

**GET /rest/v1/user_skills?user_id=eq.<user_id>&select=skill_id,skills(name),skill_points**  
Получает навыки пользователя.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/user_skills?select=skill_id,skills(name),skill_points&user_id=eq.123e4567-e89b-12d3-a456-426614174000&limit=5' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"skill_id": 1, "skills": {"name": "Программирование"}, "skill_points": 50}]
```

**POST /rest/v1/user_skills**  
Добавляет навык пользователю.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/user_skills' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"user_id": "123e4567-e89b-12d3-a456-426614174000", "skill_id": 1, "skill_points": 50}'
```  
Ответ:  
```json
{"id": 1, "user_id": "123e4567-e89b-12d3-a456-426614174000", "skill_id": 1, "skill_points": 50}
```

### Ветки (branches)

**GET /rest/v1/branches?select=id,name,description,is_active**  
Получает список веток.  
Пример:  
```bash
curl -X GET 'https://localhost/rest/v1/branches?select=id,name,description,is_active&limit=10&order=order_index.asc' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT"
```  
Ответ:  
```json
[{"id": 1, "name": "Разработка", "description": "Техническая ветка", "is_active": true}]
```

**POST /rest/v1/branches**  
Создаёт новую ветку.  
Пример:  
```bash
curl -X POST 'https://localhost/rest/v1/branches' \
-H "apikey: YOUR_API_KEY" \
-H "Authorization: Bearer YOUR_JWT" \
-H "Content-Type: application/json" \
-d '{"name": "Дизайн", "description": "Творческая ветка", "is_active": true}'
```  
Ответ:  
```json
{"id": 2, "name": "Дизайн", "description": "Творческая ветка", "is_active": true}
```

## Рекомендации

- Используйте `limit` и `offset` для больших выборок.  
- Фильтруйте по `user_id` для точных запросов.  
- Проверяйте HTTP-коды (401 — ошибка аутентификации, 400 — неверный запрос).  
- Учитывайте триггеры (`user_rank_update_trigger`, `mission_complete_trigger`) для автоматического обновления данных.  
- Следуйте формату URL Supabase: `https://localhost/rest/v1/<table>`.