# SuperMeowMeow

A charming tea shop management game where you play as a tea master creating delicious drinks for your customers. Made with Raylib.

## 🎮 Game Features

- Engaging tea shop management gameplay
- Multiple drink combinations using various ingredients
- Customer satisfaction system with emotions (Happy, Frustrated, Angry)
- Day/night cycle system
- Different difficulty levels (Easy, Medium, Hard, and Freeplay modes)
- Customizable game settings
- Beautiful 2D graphics with animated characters

## 🌐 Online Demo

Try the game directly in your browser: [Play SuperMeowMeow](https://zenthaidev.github.io/SuperMeowMeow/)

Note: The web version requires a modern browser with WebAssembly support. For the best experience, we recommend using the latest version of Chrome, Firefox, or Edge. Desktop only.

## 📸 Screenshots

![image](https://github.com/user-attachments/assets/ccddea10-1436-47bd-a387-336ecac4b010)
![image](https://github.com/user-attachments/assets/904617b7-b67d-4cab-8469-1b7ab59a2bcd)
![image](https://github.com/user-attachments/assets/ede20707-8026-438c-a40b-a1e8fa087fac)

## 🫖 How to Make Drinks

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
1. See what is the customer ordering.
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
- Work quickly - customers get impatient over time
- The faster you serve, the happier they stay
- Watch customer expressions to gauge remaining time
- Use the trash can if you make a mistake
- Pay attention to the order of ingredients

## 🛠️ Technical Features

- Built with Raylib game framework
- Cross-platform support (Desktop and Web)
- Dynamic resolution scaling
- Configurable graphics and audio settings
- Debug tools for development (when enabled)

## 🔧 Building the Project

### Prerequisites

- CMake (3.10 or higher)
- C compiler (supporting C99)
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
Make sure you have Emscripten SDK installed and properly configured in your environment.

## 🎵 Assets

The game includes various assets:
- Traditional tea preparation tools and equipment
- Various tea ingredients
- Tea cups and serving vessels
- Decorative tea shop elements
- Ambient sound effects

## 🎮 Controls

- Mouse-based interaction
- Drag and drop ingredients
- Click to interact with UI elements
- Easy-to-use interface for drink preparation

## 🔧 Configuration

The game supports various configuration options:
- Screen resolution
- Fullscreen toggle
- Sound effects volume
- Music volume
- Difficulty settings
- FPS target

## 🏗️ Code Structure

This project currently maintains all game logic in `main.c`. While this approach isn't ideal for large-scale production games, it was chosen deliberately for rapid prototyping purposes.

## 📄 License

This project is licensed under GPL-3.0 license.

## 🙏 Credits

Built with [raylib](https://www.raylib.com/) - A simple and easy-to-use library to enjoy videogames programming.
