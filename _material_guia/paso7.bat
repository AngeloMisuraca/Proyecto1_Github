@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log7.txt"
(
git checkout main
git pull
git checkout -b feature/prueba-codeql
git checkout 3c6255a -- js/app.js
git add -A
git commit -m "Prueba: código inseguro para comprobar CodeQL" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git push -u origin feature/prueba-codeql
git checkout main
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
