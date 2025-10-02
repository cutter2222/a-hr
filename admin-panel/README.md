# Admin Panel (Web) — Локальный запуск

Веб-админка на Flutter. Ниже — инструкция для запуска локально в браузере (Chrome/Edge).

## Структура проекта

```
android/
assets/
ios/
lib/
test/
web/
analysis_options.yaml
pubspec.yaml
```

## 1) Клонирование репозитория (только `admin-panel`)

```bash
git clone --no-checkout https://github.com/cutter2222/a-hr.git
cd a-hr
git sparse-checkout init --cone
git sparse-checkout set admin-panel
git checkout 10969ffa0c36fb4833e8ac72fa12039988fe2fc1
cd admin-panel
```

## 2) Установка Flutter SDK

### macOS
```bash
brew install --cask flutter
echo 'export PATH="$PATH:/usr/local/Caskroom/flutter/latest/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

### Windows
- Скачать Flutter SDK, распаковать.  
- Добавить `flutter\bin` в `PATH`.  
- Запустить PowerShell/Command Prompt.

### Проверка
```bash
flutter --version
flutter doctor
```

Убедитесь, что поддержка Web включена.

## 3) Включение web-платформы

```bash
flutter config --enable-web
flutter doctor -v
```

В списке устройств должны появиться `Chrome` / `Edge` / `Web Server`.

## 4) Зависимости

```bash
flutter pub get
```

## 5) Запуск

Chrome:
```bash
flutter run -d chrome
```

Список устройств:
```bash
flutter devices
flutter run -d edge
```

## 6) Продакшн-сборка

```bash
flutter build web --release
```

Собранные файлы будут в:
```
build/web/
```

Можно деплоить на любой статический хостинг
