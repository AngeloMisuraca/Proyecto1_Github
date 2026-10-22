@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log4a.txt"
(
git checkout -b feature/refactor-javascript
git checkout 9120a1a -- js/taskManager.js
git add -A
git commit -m "Pequeña modificación en taskManager" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git push -u origin feature/refactor-javascript
git checkout 14888e5 -- .github/workflows/ci.yml
git add -A
git commit -m "Creación archivo ci.yml" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git push
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
