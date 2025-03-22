#!/usr/bin/env bash

#cmake -S . -B build -G "Ninja Multi-Config"
cmake -S . -B build
cmake --build build --config Release
