# SuperMeowMeow

A charming tea shop management game where you play as a tea master creating delicious drinks for your customers. Built with Raylib in C.

> This project was developed as a final project for the **computer architecture and organization** course in the Software Engineering program.

## Game Features

- Tea shop management gameplay
- Multiple drink combinations using various ingredients
- Customer satisfaction system with mood states (Happy, Frustrated, Angry)
- Day/night cycle system
- Difficulty levels: Easy, Medium, Hard, and Freeplay
- Configurable game settings
- 2D graphics with animated characters

## Online Demo

Try the game directly in your browser: [Play SuperMeowMeow](https://zenithdreamer.github.io/SuperMeowMeow/)

Note: The web version requires a modern browser with WebAssembly support. Recommended: latest Chrome, Firefox, or Edge. Desktop only.

## Screenshots

![image](https://github.com/user-attachments/assets/ccddea10-1436-47bd-a387-336ecac4b010)
![image](https://github.com/user-attachments/assets/904617b7-b67d-4cab-8469-1b7ab59a2bcd)
![image](https://github.com/user-attachments/assets/ede20707-8026-438c-a40b-a1e8fa087fac)

## How to Make Drinks

### Available Ingredients

- Base Powders (1 spoon):
  - Tea Powder (Green spoon)
  - Cocoa Powder (Brown spoon)
- Liquids:
  - Hot Water
  - Normal Milk
  - Condensed Milk
- Toppings and Sauces:
  - Caramel Sauce
  - Chocolate Sauce
  - Marshmallow
  - Whipped Cream

### How to Play

1. Read the customer's order.
2. Drag and drop ingredients in the correct order:
   - Start with one spoon of base powder (Tea or Cocoa)
   - Add hot water
   - Mix in any requested milk or sauces
   - Add toppings if requested (marshmallow, whipped cream)
3. Watch the time and customer mood:
   - First 50% of time: Customer is Happy
   - After 50% of time: Customer becomes Frustrated
   - After 75% of time: Customer becomes Angry
   - If time runs out: Customer leaves (-50 points)

### Tips

- Work quickly — customers get impatient over time
- The faster you serve, the better the mood stays
- Watch customer expressions to gauge remaining time
- Use the trash can if you make a mistake
- Ingredient order matters

## Technical Details

- Built with [Raylib](https://www.raylib.com/) game framework (C99)
- Cross-platform: Desktop (Windows/Linux) and Web (via Emscripten/WebAssembly)
- Dynamic resolution scaling with configurable fullscreen support
- Drag-and-drop input system using mouse interaction
- State-machine-based game loop (menu, gameplay, settings, results)
- Configurable audio (SFX/music volume) and graphics (FPS target, resolution) settings
- Debug tools available at compile time via preprocessor flags

## Code Structure

> This is a final project for the computer architecture and organization course. All game logic lives in a single `main.c` to keep memory layout, data flow, and control structures visible in one place, consistent with the low-level focus of the course. Ideally, the code would be split into separate modules (rendering, input, audio, game state, UI, etc.).

## Building the Project

### Prerequisites

- CMake (3.10 or higher)
- C compiler with C99 support
- For web builds: Emscripten SDK

### Desktop Build

#### Windows (Visual Studio)

```batch
build-vs.bat
```

#### Windows (Web)

```batch
build-web.bat
```

#### Linux ARM

```bash
./build-armv7l.sh
```

### Web Build

Make sure Emscripten SDK is installed and properly configured in your environment before running the web build script.

## Assets

- Traditional tea preparation tools and equipment
- Ingredient sprites and textures
- Tea cups and serving vessels
- Decorative shop elements
- Ambient sound effects and music

## Controls

- Mouse-based interaction
- Drag and drop ingredients
- Click to interact with UI elements

## Configuration

The game supports the following settings:

- Screen resolution
- Fullscreen toggle
- Sound effects volume
- Music volume
- Difficulty
- FPS target

## Contributors

[@kawinhill](https://github.com/kawinhill)
[@mixiki](https://github.com/mixiki)
[@m0owo](https://github.com/m0owo)
[@Pixako-Unrealistia](https://github.com/Pixako-Unrealistia)
[@zenithdreamer](https://github.com/zenithdreamer)

## License

This project is licensed under the GPL-3.0 license.

All art assets (sprites, tools, backgrounds, UI) are copyrighted to the [Contributors](#contributors), all rights reserved, except where noted below.

## Credits

Built with [raylib](https://www.raylib.com/) — A simple and easy-to-use library for videogame programming.

Background music "My Heart" by [Yojo Summer](https://open.spotify.com/artist/7qAponFaTtOs7WpO8Dijou) ([SoundCloud](https://soundcloud.com/yojo_summer), [YouTube](https://www.youtube.com/watch?v=42yX4Ww2e68)).
