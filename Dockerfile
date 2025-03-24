FROM archlinux:latest

# Update the package database and install necessary packages
RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm base-devel

# Add any additional setup or packages you need here
# Example: RUN pacman -S --noconfirm git