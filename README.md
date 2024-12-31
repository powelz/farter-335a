# **Farter - A World of Warcraft Addon**

Farter is a lightweight World of Warcraft addon that adds a touch of humor to your gameplay by playing a sound effect whenever you successfully cast a spell. Designed for Wrath of the Lich King (3.3.5a), this addon is easy to install and use.

## **Features**
- Plays a custom sound effect (`fart.mp3`) on successful spell casts.
- Simple, lightweight, and unobtrusive.
- Easily customizable for those who want to change the sound effect.

## **Installation**

1. **Download the Addon**: Obtain the latest version of Farter as a `.zip` file.
2. **Extract the Folder**: Extract the `Farter` folder from the `.zip` file.
3. **Add to WoW Directory**: Place the `Farter` folder in your World of Warcraft AddOns directory:
   - **Windows**: `C:\Program Files (x86)\World of Warcraft\_classic_\Interface\AddOns`
   - **macOS**: `/Applications/World of Warcraft/_classic_/Interface/AddOns`
4. **Enable the Addon**: Relaunch WoW and enable Farter from the AddOns menu in the character selection screen.

## **How It Works**

1. The addon listens for the `UNIT_SPELLCAST_SUCCEEDED` event.
2. When the player successfully casts a spell, the addon plays the `fart.mp3` sound file.
3. The sound is played only for the player’s actions, ensuring no interference with other players.

## **Customization**

If you want to use a different sound effect:
1. Replace the `fart.mp3` file located in the `sounds` folder with your desired `.mp3` file.
2. Ensure the new file is named `fart.mp3` to maintain compatibility with the addon.

## **Compatibility**

- **Game Version**: This addon is designed for World of Warcraft 3.3.5a (Wrath of the Lich King). It may not work on other versions of the game.
- **Performance**: The addon is lightweight and has no noticeable impact on gameplay performance.

## **Contributing**

Contributions are welcome. If you’d like to report an issue, suggest a feature, or contribute code, please submit an issue or pull request on the [GitHub repository](#).

## **License**

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this addon with proper attribution.
