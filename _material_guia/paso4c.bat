@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log4c.txt"
(
git checkout 08c8c7f -- js/taskManager.js
git add -A
git commit -m "error solucionado en taskmanager" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
call npm test
git push
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
