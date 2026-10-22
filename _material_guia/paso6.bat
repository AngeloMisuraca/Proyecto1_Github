@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log6.txt"
(
git checkout main
git pull
git checkout -b feature/paso-16
git checkout 9a26ba5 -- css/style.css index.html
copy /Y _material_guia\README.md README.md
git add -A
git commit -m "Paso 16 cambio footer" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
call npm test
git push -u origin feature/paso-16
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
