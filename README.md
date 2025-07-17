# TravelSimulator Docker Build (One-Time)

## 📦 Как использовать

1. Зарегистрируйся на https://render.com (если ещё не)
2. Создай новый "Private Service" с типом **Docker**
3. Зальёшь всё содержимое этой папки
4. Render автоматически соберёт Docker и соберёт APK
5. Готовый `.apk` лежит в `/app/output`

## 🧱 Локальная сборка через Docker

```bash
git clone <этот архив>
cd TravelSimulator_Docker_OneShot
docker build -t travelsim .
docker run --rm -v $PWD/output:/app/output travelsim
```

APK появится в `output/`
