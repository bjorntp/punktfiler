#!/bin/bash
# Configuration
THEME_STATE_DIR="$HOME/.cache/theme"
THEME_STATE_FILE="$THEME_STATE_DIR/state"
WALLPAPER_STATE_FILE="$THEME_STATE_DIR/wallpaper_state"
GTK_CONFIG_DIR="$HOME/.config/gtk-3.0"
ROFI_CONFIG_DIR="$HOME/.config/rofi"
HYPRPAPER_CONFIG="$HOME/.config/hypr/hyprpaper.conf"

# Create theme state directory and file if they don't exist (default to dark)
if [ ! -d "$THEME_STATE_DIR" ]; then
    mkdir -p "$THEME_STATE_DIR"
fi
if [ ! -f "$THEME_STATE_FILE" ]; then
    echo "dark" > "$THEME_STATE_FILE"
fi
if [ ! -f "$WALLPAPER_STATE_FILE" ]; then
    echo "$HOME/pictures/gbarchdark.png" > "$WALLPAPER_STATE_FILE"
fi

# Create GTK config directory if it doesn't exist
if [ ! -d "$GTK_CONFIG_DIR" ]; then
    mkdir -p "$GTK_CONFIG_DIR"
fi

# Create or update GTK settings file if it doesn't exist
if [ ! -f "$GTK_CONFIG_DIR/settings.ini" ]; then
    echo "[Settings]" > "$GTK_CONFIG_DIR/settings.ini"
fi

# Get current theme state
CURRENT_THEME=$(cat "$THEME_STATE_FILE")

# Toggle theme state
if [ "$CURRENT_THEME" = "dark" ]; then
    NEW_THEME="light"
    GTK_DARK_VALUE="0"
    WALLPAPER_PATH="$HOME/pictures/gbarchlight.png"
    cp "$ROFI_CONFIG_DIR/config.rasi.light" "$ROFI_CONFIG_DIR/config.rasi"
else
    NEW_THEME="dark"
    GTK_DARK_VALUE="1"
    WALLPAPER_PATH="$HOME/pictures/gbarchdark.png"
    cp "$ROFI_CONFIG_DIR/config.rasi.dark" "$ROFI_CONFIG_DIR/config.rasi"
fi

# Save new theme state and wallpaper path
echo "$NEW_THEME" > "$THEME_STATE_FILE"
echo "$WALLPAPER_PATH" > "$WALLPAPER_STATE_FILE"
cp $WALLPAPER_PATH ~/.cache/theme/wallpaper

# Update hyprpaper config file
cat > "$HYPRPAPER_CONFIG" << EOF
preload = $WALLPAPER_PATH
wallpaper = ,$WALLPAPER_PATH
ipc = on
EOF

# Apply wallpaper changes through hyprctl
hyprctl hyprpaper preload "$WALLPAPER_PATH" 2>/dev/null || true
hyprctl hyprpaper wallpaper ",$WALLPAPER_PATH" 2>/dev/null || true

# Update GTK settings for Signal and other GTK applications
if grep -q "gtk-application-prefer-dark-theme" "$GTK_CONFIG_DIR/settings.ini"; then
    # Update existing setting
    sed -i "s/gtk-application-prefer-dark-theme=./gtk-application-prefer-dark-theme=$GTK_DARK_VALUE/" "$GTK_CONFIG_DIR/settings.ini"
else
    # Add the setting if it doesn't exist
    echo "gtk-application-prefer-dark-theme=$GTK_DARK_VALUE" >> "$GTK_CONFIG_DIR/settings.ini"
fi

# Set environment variables for GTK applications like Signal
export GTK_THEME_VARIANT="$NEW_THEME"

# Set environment variable for other applications that might use it
export THEME_PREFERENCE="$NEW_THEME"

# Set system color scheme through gsettings if it's available
if command -v gsettings &> /dev/null; then
    if [ "$NEW_THEME" = "dark" ]; then
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true
    else
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 2>/dev/null || true
    fi
fi

# Update Hyprland environment variables 
hyprctl keyword env "THEME_PREFERENCE=$NEW_THEME" 2>/dev/null || true
hyprctl keyword env "GTK_THEME_VARIANT=$NEW_THEME" 2>/dev/null || true
hyprctl keyword env "GTK_APPLICATION_PREFER_DARK_THEME=$GTK_DARK_VALUE" 2>/dev/null || true
