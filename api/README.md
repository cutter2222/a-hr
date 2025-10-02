# 📖 Документация API для проекта хакатона

Документация REST API для проекта на **Supabase**, созданная для демонстрации  

**Примечание**:   
Все GET-запросы ограничены 100 записями (`limit=100`) для удобства и производительности.  


# 🔑 Базовая информация
- **Базовый URL**: `https://api.izbox.ru/rest/v1`  
- **Anon Key**:  указан в документации


## 1. Получение профиля пользователя

Возвращает данные профиля пользователя: email, уровень, XP, ранг, ветку.

- **Эндпоинт**: `GET /users?select=*&limit=100`
- **Пример запроса**:
    
    ```bash
    curl -X GET 'https://api.izbox.ru/rest/v1/users?select=*&limit=100' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>"
    ```
    
- **Пример ответа**:
    
    ```json
    [
      {
        "id": "550e8400-e29b-41d4-a716-446655440000",
        "email": "user@example.com",
        "xp_points": 500,
        "level": 2,
        "first_name": "Иван",
        "last_name": "Иванов",
        "rank_id": 1,
        "branch_id": 1,
        "rank_title": "Новичок",
        "branch_name": "Разработка"
      }
    ]
    ```

---

## 2. Получение списка миссий

Возвращает миссии с названием, описанием, наградами (XP, монеты), статусом и доступностью.

- **Эндпоинт**: `GET /view_missions?select=id,title,description,xp_points,coins,is_unlocked,user_missions_status&limit=100`
- **Пример запроса**:
    
    ```bash
    curl -X GET 'https://api.izbox.ru/rest/v1/view_missions?select=id,title,description,xp_points,coins,is_unlocked,user_missions_status&limit=100' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>"
    ```
    
- **Пример ответа**:
    
    ```json
    [
      {
        "id": 1,
        "title": "Введение в разработку",
        "description": "Пройдите базовый курс по программированию",
        "xp_points": 100,
        "coins": 50,
        "is_unlocked": true,
        "user_missions_status": "in_progress"
      },
      {
        "id": 2,
        "title": "Создание API",
        "description": "Разработайте REST API",
        "xp_points": 200,
        "coins": 100,
        "is_unlocked": false,
        "user_missions_status": null
      }
    ]
    ```

---

## 3. Покупка продукта в магазине

Выполняет покупку продукта, проверяя монеты, лимиты и склад.

- **Эндпоинт**: `POST /rpc/purchase_shop_product`
- **Тело запроса**:
    
    ```json
    {
      "in_shop_product_id": 1
    }
    ```
    
- **Пример запроса**:
    
    ```bash
    curl -X POST 'https://api.izbox.ru/rest/v1/rpc/purchase_shop_product' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>" \
    -H "Content-Type: application/json" \
    -d '{"in_shop_product_id": 1}'
    ```
    
- **Пример ответа**:
    
    ```json
    {
      "status": "success",
      "message": "Purchase completed successfully",
      "purchase_id": 101,
      "coins_spent": 200
    }
    ```

---

## 4. Получение наград пользователя

Возвращает список наград с их статусом (получены или нет) и редкостью.

- **Эндпоинт**: `GET /view_rewards?select=id,name,description,is_earned,rarity_name&limit=100`
- **Пример запроса**:
    
    ```bash
    curl -X GET 'https://api.izbox.ru/rest/v1/view_rewards?select=id,name,description,is_earned,rarity_name&limit=100' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>"
    ```
    
- **Пример ответа**:
    
    ```json
    [
      {
        "id": 1,
        "name": "Значок новичка",
        "description": "Награда за первый ранг",
        "is_earned": true,
        "rarity_name": "Обычная"
      },
      {
        "id": 2,
        "name": "Золотая медаль",
        "description": "Награда за высокий ранг",
        "is_earned": false,
        "rarity_name": "Редкая"
      }
    ]
    ```

---

## 5. Получение логов активности

Возвращает историю активности пользователя: изменения XP, монет, типы событий.

- **Эндпоинт**: `GET /view_logbook?select=id,created_at,entity_type,entity_name,xp_points_change,coins_change&limit=100`
- **Пример запроса**:
    
    ```bash
    curl -X GET 'https://api.izbox.ru/rest/v1/view_logbook?select=id,created_at,entity_type,entity_name,xp_points_change,coins_change&limit=100' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>"
    ```
    
- **Пример ответа**:
    
    ```json
    [
      {
        "id": 1,
        "created_at": "2025-09-29T10:00:00+00:00",
        "entity_type": "mission",
        "entity_name": "Введение в разработку",
        "xp_points_change": 100,
        "coins_change": 50
      },
      {
        "id": 2,
        "created_at": "2025-09-29T12:00:00+00:00",
        "entity_type": "purchase",
        "entity_name": "Фирменная футболка",
        "xp_points_change": 0,
        "coins_change": -200
      }
    ]
    ```

---

## 6. Получение топа пользователей за месяц

Возвращает рейтинг пользователей по XP за текущий месяц.

- **Эндпоинт**: `GET /view_top_users_month?select=rank_position_by_xp,user_id,first_name,last_name,total_xp_change&limit=100`
- **Пример запроса**:
    
    ```bash
    curl -X GET 'https://api.izbox.ru/rest/v1/view_top_users_month?select=rank_position_by_xp,user_id,first_name,last_name,total_xp_change&limit=100' \
    -H "Authorization: Bearer <anon_key>" \
    -H "apikey: <anon_key>"
    ```
    
- **Пример ответа**:
    
    ```json
    [
      {
        "rank_position_by_xp": 1,
        "user_id": "550e8400-e29b-41d4-a716-446655440000",
        "first_name": "Иван",
        "last_name": "Иванов",
        "total_xp_change": 1000
      },
      {
        "rank_position_by_xp": 2,
        "user_id": "550e8400-e29b-41d4-a716-446655440001",
        "first_name": "Мария",
        "last_name": "Петрова",
        "total_xp_change": 800
      }
    ]
    ```

---