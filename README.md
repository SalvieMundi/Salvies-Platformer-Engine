# Salvie's Platformer Engine
A versatile 2D Platformer Engine in GML that includes a variety of functionality

## Checklist
Items will be crossed off as they are completed. Goals which are being worked on or have been finished will have sub-goals.

* Physics Engine
  * Allows different gravity directions
  * Allows gravity based on a gravity emmitter ("Mario Galaxy gravity")
  * Allows for bouncy objects
  * Allows for per object gravity or game-wide gravity, which can be toggled on the fly
  * Gravity and physics values can be set in the room editor
* Camera
  * Allows for deactivation of objects outside the view
  * Allows for a list of objects to be exempted from deactivation
  * Allows for rigid or lerping camera
  * Allows for zooming in and out without affecting the in-game resolution
  * Allows for tinting
  * Allows for camera shaking
  * Allows for a changeable target that can be changed on the fly with an instance_id or object index
* Input and Button Mapping
  * Allows for remapping of inputs
  * Allows inputs from keyboard, mouse / touch or gamepad
  * Allows for up to four controllers to be connected
  * Controllers are automatically stored, cleared and re-arranged for easy access
  * Allows for the following inputs (these can be mapped to any kind of action, but these are the most common types of inputs for platformers)
    * Up
    * Down
    * Left
    * Right
    * Jump
    * Attack
    * Interact
    * Special
    * Pause
  * Gamepad buttons are automatically renamed based on the type of controller (X for Sony, B for Nintendo, A for Xbox or general)
* In-Game Debugger
  * Typing "debug" on a keyboard brings up the debug console, similar to Minecraft
  * Help command -- get info about the debug console
  * Exit command -- exit the debug console or the game
  * Get command -- get a value from a global, object or instance's variable or struct
  * Set command -- set a global variable, or a variable in an object or instance to a specified value
  * Spawn command -- spawn an instance of an object either at the center of the current view, or at a specified x and y coordinate
  * Remove command -- remove an instance or all objects of a particular object index
  * Run command -- run a user-made script
* Lighting Engine
  * Relatively lightweight -- can easily handle 100 on-screen light sources on any platform (significantly more on windows, linux and mac os)
  * Doesn't redraw lights or shadows if not necessary (light isn't moving, or lighting isn't on, or ambient light is too strong)
  * Works with all rectangular collision masks (circular objects can also work if the mask is set up correctly)
  * Works with stretched, flipped and / or rotated objects
  * Uses depth sorting, so objects cannot have shadows cast onto them from things behind them, but objects can have shadows cast onto them from things in front of them
  * Shadow strength is affected by object depth, distance to the light, and the presence of other lights
  * Lights can have a strength, color, distance and flicker amount
  * Shadows can have a strength, color and distance
  * All lighting variables can be set per-instance in the room editor or via code
  * Lighting engine can have a framerate independent of the game in order to increase performance
  * Lighting engine automatically halves framerate if the game's framerate falls below it's target (eg: gets 50 fps when aiming for 60)
  * Has 3 lighting modes (gaussian, retro banded, and retro dithered)
  * Support for setting an individual light's sprite so that things like flashlights and light beams can be easily created
* Simple Animation Engine
  * Allows for basic animations on instances without requiring additional sprites
  * Animations include
    * Squash and stretch -- grow or shrink a sprite on the x and / or y axis over a period of milliseconds; can control whether the sprite should return to it's previous xscale and yscale during the animation window or simply shrink or grow to the new target size
    * Fading -- fade in or out using transparency over a period of milliseconds; partial fades are allowed; can control whether the sprite should return to it's previous alpha amount during the animation window or simply fade to the new alpha amount
    * Flickering -- apply a flicker / fuzz to an instance; the type (flicker or fuzz) and period of time (in milliseconds) are controllable; time can be set to instant (0) or infinity
    * Coloring -- apply a color to a sprite, fading the color in over a period of milliseconds; the time can be instant (0) or infinity
    * Rotation -- apply a rotation to a sprite over a period of milliseconds; can control whether the sprite should return to it's previous angle during the animation window or simply rotate to the new target angle 
