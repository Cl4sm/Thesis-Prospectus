@echo off
REM Thesis Prospectus - Windows Build Script
REM Wil Gibbs | ASU SEFCOM
REM
REM Usage:
REM   build          - Build PDF (two passes for cross-refs)
REM   build once     - Single pass (faster)
REM   build watch    - Auto-rebuild PDF on file changes (Ctrl+C to stop)
REM   build clean    - Remove build artifacts
REM   build distclean- Remove artifacts + PDF

if "%1"=="" goto build
if "%1"=="once" goto once
if "%1"=="watch" goto watch
if "%1"=="clean" goto clean
if "%1"=="distclean" goto distclean
echo Unknown command: %1
echo Usage: build [once^|watch^|clean^|distclean]
goto end

:build
echo === Pass 1 of 2 ===
pdflatex -interaction=nonstopmode -halt-on-error main.tex
if errorlevel 1 (
    echo.
    echo BUILD FAILED on pass 1. Check main.log for details.
    goto end
)
echo === Pass 2 of 2 ===
pdflatex -interaction=nonstopmode -halt-on-error main.tex
if errorlevel 1 (
    echo.
    echo BUILD FAILED on pass 2. Check main.log for details.
    goto end
)
echo.
echo BUILD SUCCESSFUL: main.pdf
goto end

:once
echo === Single pass ===
pdflatex -interaction=nonstopmode -halt-on-error main.tex
if errorlevel 1 (
    echo BUILD FAILED. Check main.log for details.
) else (
    echo BUILD SUCCESSFUL: main.pdf
)
goto end

:watch
echo === Watch mode (Ctrl+C to stop) ===
latexmk -pdf -pvc -view=none -interaction=nonstopmode -halt-on-error main.tex
if errorlevel 1 (
    echo WATCH EXITED WITH ERRORS. Check main.log for details.
)
goto end

:clean
echo Cleaning build artifacts...
del /q main.aux main.log main.out main.toc 2>nul
del /q main.lof main.lot main.bbl main.blg 2>nul
del /q main.nav main.snm main.vrb 2>nul
del /q main.fdb_latexmk main.fls main.synctex.gz 2>nul
echo Done.
goto end

:distclean
call %0 clean
del /q main.pdf 2>nul
echo Removed main.pdf.
goto end

:end
