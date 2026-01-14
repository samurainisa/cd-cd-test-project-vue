#!/bin/bash
set -euo pipefail

echo "Установка Docker..."

sudo apt update

sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "Добавление пользователя $USER в группу docker..."
sudo usermod -aG docker $USER

echo "Создание директории для проекта..."
mkdir -p /home/$USER/cd-cd-test-project-vue

echo ""
echo "Установка завершена!"
echo ""
echo "ВАЖНО: Перелогинься (выйди и зайди по SSH снова) чтобы группа docker применилась"
echo ""
echo "Следующие шаги:"
echo "  1. Перелогинься: exit && ssh samurainisa@your-server-ip"
echo "  2. Создай docker-compose.yml в /home/$USER/cd-cd-test-project-vue/"
echo "  3. Установи SSL сертификат (когда будет нужен):"
echo "     sudo apt install -y snapd"
echo "     sudo snap install --classic certbot"
echo ""
echo "Проверка установки:"
echo "  docker --version"
echo "  docker compose version"
