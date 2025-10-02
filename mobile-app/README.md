# App — Локальный запуск и тестирование

Инструкция для локального запуска и тестирования приложения на **Android**, **iOS** и **Web (Chrome/Edge)**. Без деплоя и без подписей — только dev‑режим с hot reload.

## 0) Структура проекта
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

## 1) Клонирование репозитория
```bash
git clone https://github.com/cutter2222/a-hr.git
cd a-hr
git checkout 10969ffa0c36fb4833e8ac72fa12039988fe2fc1
```

> Фиксируемся на конкретном коммите для воспроизводимости окружения.

## 2) Установка инструментов

### Flutter SDK
#### macOS
```bash
brew install --cask flutter
echo 'export PATH="$PATH:/usr/local/Caskroom/flutter/latest/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

#### Windows
1) Скачать Flutter SDK и распаковать.  
2) Добавить `flutter\bin` в `PATH`.  
3) Открыть PowerShell/Command Prompt.

### Android (эмулятор/устройство)
1) Установить **Android Studio** (SDK + AVD Manager).  
2) Запустить Android Studio → **Device Manager** → создать виртуальное устройство (Pixel + любой образ с Google APIs).  
3) Либо подключить физическое устройство: включить **Developer options** + **USB debugging**.

### iOS (симулятор/устройство, только macOS)
1) Установить **Xcode** из App Store.  
2) Первый запуск: открыть Xcode → принять лицензии → установить дополнительные компоненты.  
3) Для CocoaPods (если запросит): `sudo gem install cocoapods`.

### Проверка окружения
```bash
flutter --version
flutter doctor -v
```
Убедитесь, что отмечены галочками нужные платформы (**Android toolchain**, **Xcode**, **Chrome**).

## 3) Установка зависимостей
```bash
flutter pub get
```

## 4) Запуск в dev‑режиме (hot reload)

### Web (Chrome/Edge)
Самый быстрый способ проверить UI без эмуляторов.
```bash
flutter run -d chrome
# или
flutter run -d edge
```
Полезные параметры:
```bash
flutter run -d chrome --web-renderer html        # более лёгкий рендерер
flutter run -d chrome --web-renderer canvaskit   # более плавная графика
```

### Android
1) Запустить AVD (или подключить телефон по USB).  
2) Проверить устройства:
```bash
flutter devices
```
3) Запустить:
```bash
flutter run -d android
```

### iOS (симулятор)
```bash
flutter run -d ios
```
> Если при первом запуске CocoaPods попросит доустановки — согласитесь. Подписывать ничего не нужно, симулятор работает без сертификатов.

### Горячая перезагрузка/перезапуск
- **Hot Reload:** сохранить файл в `lib/…` → в терминале нажать **`r`**.  
- **Hot Restart:** нажать **`R`** (полный рестарт без выхода).

## 5) Полезные команды разработки
```bash
flutter pub outdated        # посмотреть устаревшие зависимости
flutter clean               # очистить сборку, если что-то сломалось
flutter analyze             # статический анализ
flutter test                # юнит‑тесты из папки test/
```

## 6) Типичные проблемы и решения

- **Chrome не виден как устройство.**  
  Выполнить: `flutter config --enable-web`, затем `flutter doctor -v` и перезапустить терминал.

- **Эмулятор Android не появляется.**  
  Установить через Android Studio → SDK, Platform Tools, создать AVD в Device Manager. Проверить `adb devices`.

- **iOS: ошибка с CocoaPods.**  
  Установить Pods: `sudo gem install cocoapods`, затем из корня проекта выполнить `cd ios && pod install && cd ..` и повторить запуск.

- **Не подтянулись зависимости.**  
  `flutter pub get` ещё раз. При необходимости `flutter clean` → `flutter pub get`.

- **Белый экран при старте (Web).**  
  Попробовать другой рендерер: `--web-renderer html` или `--web-renderer canvaskit`.

---

Готово. После выполнения шагов выше приложение работает локально в dev‑режиме на выбранном устройстве/в браузере с поддержкой hot reload.