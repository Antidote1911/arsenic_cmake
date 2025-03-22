#!/usr/bin/env bash

cmake -S . -B build -G "Ninja Multi-Config"
cmake --build build --config Release
