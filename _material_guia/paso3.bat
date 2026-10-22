@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log3.txt"
(
echo === npm install
call npm install
echo === npm test - proyecto de partida
call npm test
echo === refactor y tests
git checkout fa763b8 -- .
git rm tests/app.test.js
copy /Y _material_guia\taskManager.test.js tests\taskManager.test.js
echo === npm test - despues del refactor
call npm test
git add -A
git commit -m "commit paso 4" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
echo === push - se espera rechazo
git push
echo === pull y merge
git pull --no-rebase --no-edit origin main
git push
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
