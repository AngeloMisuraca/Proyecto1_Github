@echo off
chcp 65001 >nul
cd /d "%~dp0.."
set "LOG=%~dp0log8.txt"
(
git checkout main
git pull
echo === diferencias con el original
git diff --stat original/main main
echo === estado
git status --short
git log --oneline --graph -8
echo FIN
) > "%LOG%" 2>&1
