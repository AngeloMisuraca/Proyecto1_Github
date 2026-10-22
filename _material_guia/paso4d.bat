@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log4d.txt"
(
git checkout 7776935 -- .github/workflows/deploy.yml
git add -A
git commit -m "Paso 12: workflow de despliegue automático a GitHub Pages" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01JQN7eyTWHrfbzes1nPyqzp"
git push
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
