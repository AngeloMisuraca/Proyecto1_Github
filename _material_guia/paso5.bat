@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log5.txt"
(
git checkout main
git pull
git checkout -b feature/dependabot
git checkout a59178d -- .github/dependabot.yml
git add -A
git commit -m "gestion dependabot" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git push -u origin feature/dependabot
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
