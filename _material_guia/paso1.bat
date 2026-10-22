@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log1.txt"
(
echo === versiones
git --version
node --version
npm --version
echo === init
git init
git config user.name "AngeloMisuraca"
git config user.email "233230392+AngeloMisuraca@users.noreply.github.com"
git config credential.https://github.com.username AngeloMisuraca
git remote add origin https://github.com/AngeloMisuraca/Proyecto1_Github.git
git remote add original https://github.com/angelo808080-lgtm/Proyecto1_Entrega.git
echo === fetch original
git fetch original
git fetch original pull/9/head
echo === commit inicial
git add .gitignore README.md index.html css js package.json tests
git commit -m "Initial commit: DevTasks web project" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git branch -M main
echo === push
git push -u origin main
echo === estado
git status --short
git log --oneline -3
echo FIN
) > "%LOG%" 2>&1
echo _material_guia/>> .git\info\exclude
