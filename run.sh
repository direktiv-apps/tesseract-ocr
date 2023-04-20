#!/bin/sh

docker build -t tesseract-ocr . && docker run -p 9191:8080 tesseract-ocr