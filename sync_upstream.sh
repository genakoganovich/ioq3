#!/bin/bash
echo "🔄 Синхронизация с оригинальным репозиторием..."

# Сохраняем текущую ветку
CURRENT_BRANCH=$(git branch --show-current)

# Переходим в main
git checkout main

# Получаем обновления из upstream
git fetch upstream

# Сливаем в main
if git merge upstream/main; then
    echo "✅ Main обновлен успешно"
    
    # Пушим обновленный main в ваш репозиторий
    git push origin main
    
    echo "📋 Хотите слить изменения в gena-modifications? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        git checkout gena-modifications
        if git merge main; then
            echo "✅ Ветка gena-modifications обновлена"
            git push origin gena-modifications
        else
            echo "⚠️ Есть конфликты! Разрешите их и выполните:"
            echo "git add ."
            echo "git commit"
            echo "git push origin gena-modifications"
        fi
    else
        # Возвращаемся на исходную ветку
        git checkout $CURRENT_BRANCH
    fi
else
    echo "⚠️ Конфликт при слиянии main! Разрешите конфликты."
fi
