# Salvie's Platformer Engine
A versatile 2D Platformer Engine in GML that includes a variety of functionality

## Checklist
Items will be crossed off as they are completed. Goals which are being worked on or have been finished will have sub-goals.

* ~~Physics Engine~~
  * ~~Allows different gravity directions~~
  * ~~Allows gravity based on a gravity emmitter ("Mario Galaxy gravity")~~
  * ~~Allows for bouncy objects~~
  * ~~Allows for per object gravity or game-wide gravity, which can be toggled on the fly~~
  * ~~Gravity and physics values can be set in the room editor~~
  * ~~Allow for sticky and icy walls and floors~~
  * ~~Allow for frictional forces such as water; also allow friction to allow speed ups and slow downs~~
  * ~~Allow for moving platforms~~


* ~~Camera~~
  * ~~Allows for deactivation of objects outside the view~~
  * ~~Allows for a list of objects to be exempted from deactivation~~
  * ~~Allows for rigid or lerping camera~~
  * ~~Allows for zooming in and out without affecting the in-game resolution~~
  * ~~Allows for tinting~~
  * ~~Allows for camera shaking~~
  * ~~Allows for a changeable target that can be changed on the fly with an instance_id or object index~~


* Input and Button Mapping
  * ~~Allows for remapping of inputs~~
  * ~~Allows inputs from keyboard, mouse / touch or gamepad~~
  * ~~Allows for up to four controllers to be connected~~
  * ~~Controllers are automatically stored, cleared and re-arranged for easy access~~
  * ~~Inputs are completely customizable, name-able, and can be added to, removed or have a key, button or mouse button assigned to them~~
  * ~~Gamepad buttons are automatically renamed based on the type of controller (X for Sony, B for Nintendo, A for Xbox or general)~~
  * Gamepad analog sticks are treated in the same fashion as the d-pad


* In-Game Debugger
  * ~~Typing "debug" on a keyboard brings up the debug console, similar to Minecraft~~
  * ~~Pressing up on the keyboard retrieves a brief history of typed commands~~
  * ~~Help command -- get info about the debug console~~
  * ~~Exit command -- exit the debug console or the game~~
  * ~~Get command -- get a value from a global, object or instance's variable or struct~~
  * ~~Set command -- set a global variable, or a variable in an object or instance to a specified value~~
  * Spawn command -- spawn an instance of an object either at the center of the current view, or at a specified x and y coordinate
  * Remove command -- remove an instance or all objects of a particular object index
  * Run command -- run a user-made script


* ~~Lighting Engine~~
  * ~~Relatively lightweight -- can easily handle 100 on-screen light sources on any platform (significantly more on windows, linux and mac os)~~
  * ~~Doesn't redraw lights or shadows if not necessary (light isn't moving, or lighting isn't on, or ambient light is too strong)~~
  * ~~Works with all rectangular collision masks (circular objects can also work if the mask is set up correctly)~~
  * ~~Works with stretched, flipped and / or rotated objects~~
  * ~~Uses depth sorting, so objects cannot have shadows cast onto them from things behind them, but objects can have shadows cast onto them from things in front of them~~
  * ~~Shadow strength is affected by object depth, distance to the light, and the presence of other lights~~
  * ~~Lights can have a strength, color, distance and flicker amount~~
  * ~~Shadows can have a strength, color and distance~~
  * ~~All lighting variables can be set per-instance in the room editor or via code~~
  * ~~Lighting engine can have a framerate independent of the game in order to increase performance~~
  * ~~Lighting engine automatically halves framerate if the game's framerate falls below it's target (eg: gets 50 fps when aiming for 60)~~
  * ~~Has 3 lighting modes (gaussian, retro banded, and retro dithered)~~
  * ~~Support for setting an individual light's sprite so that things like flashlights and light beams can be easily created~~


* Simple Animation Engine
  * Allows for basic animations on instances without requiring additional sprites
  * Animations include
    * Squash and stretch -- grow or shrink a sprite on the x and / or y axis over a period of milliseconds; can control whether the sprite should return to it's previous xscale and yscale during the animation window or simply shrink or grow to the new target size
    * Fading -- fade in or out using transparency over a period of milliseconds; partial fades are allowed; can control whether the sprite should return to it's previous alpha amount during the animation window or simply fade to the new alpha amount
    * Flickering -- apply a flicker / fuzz to an instance; the type (flicker or fuzz) and period of time (in milliseconds) are controllable; time can be set to instant (0) or infinity
    * Coloring -- apply a color to a sprite, fading the color in over a period of milliseconds; the time can be instant (0) or infinity
    * Rotation -- apply a rotation to a sprite over a period of milliseconds; can control whether the sprite should return to it's previous angle during the animation window or simply rotate to the new target angle 


* Dialogue Engine & Translation
  * Allows for easy translation, as all strings are loaded from a separate text file based on the language setting
  * Allows for any object with the proper variables to speak
  * Allows objects to speak using a text bubble which appears above them and doesn't freeze the player
    * These text bubbles have a generic sprite background
    * These text bubbles can not have a character sprite placed in them
    * These text bubbles use a "text sound" set in the instance that is speaking
    * These text bubbles use a scroll speed that is set in the instance that is speaking
    * These text bubbles display a series of text pages set in the instance that is speaking
    * These text bubbles will automatically advance to the next page of text after a period of time, set in the instance that is speaking
    * These text bubbles can advance pages when the player presses a specific button, set in the instance that is speaking
    * These text bubbles can not give the player options or choices
  * Allows objects to speak using a larger text box placeable anywhere on the screen which puts all objects in a specified freeze list into a frozen state until the text box is destroyed
    * These text boxes are shown by creating a text box object instance
    * These text boxes can show a character sprite in the left or right side
    * These text boxes can have a changeable background sprite
    * These text boxes have a "text sound" variable which can be changed mid-way through a series of text pages
    * These text boxes have a scroll speed variable that can be changed mid-way through a series of text pages
    * These text boxes display a series of text pages set in a texts variable that can be changed mid-way through a series of text pages
    * These text boxes will NOT automatically advance to the next page of text without player input
    * These text boxes can change their scroll speed when the player presses a specific button, set in a "scroll faster button" variable
    * These text boxes can flip to the next page of text when the player presses a specific button, set in a "skip page button" variable
    * These text boxes can give the player options or choices to pick from, which will execute scripts when selected
  * Text in any dialogue box or bubble can have a variety of effects
    * Color -- specified by using a color tag (eg: [#FFFFFF]This text is white [#000000]and now it's black)
    * Wave -- specified by using a wave tag (eg: This is normal text [wave]but this text waves up and down)
    * Flicker -- specified by using a flicker tag (eg: This is normal text [flicker]but this text flickers like static)
    * Font Change -- specified by using a font tag (eg: [FNT_Normal]This is the normal font [FNT_Small]but this is the small font); please note, the text bubble and box will not re-adjust spacing for bigger and smaller fonts, so you may want to test this out to ensure it looks ok


* Sound & Music Engine
  * Sounds are played with spacial awareness (eg: sounds coming from an instance on the left side of the player object will play more out of the left speaker, and sounds made by instances further from the player object will be quieter than those made by instances directly beside the player object)
  * Spacial awareness target can be set on the fly
  * Music can be played on loop or not
  * Looped music can loop from the end to beginning, or from the end to a specified point in the song, allowing for an "intro"
  * Music and SFX volume can be changed on the fly (eg: in a settings menu)
  * Music can be faded in and out on the fly
  * Simply changing the music track will automatically fade out the currently playing music for a specified amount of time and instantly play the new track once the old one is totally faded out


* Rooms & Transitions
  * Allows every room to show an optional title, subtitle and banner sprite when the room is loaded
  * Allows every room to change the background music automatically when loaded, without requiring any code, and will fade out music with the room transition if the next room is supposed to play a different track
  * Allows for several types of transitions
    * None -- a hard cut occurs between rooms
    * Fade -- the current room is faded out, and then the new room fades in
    * Swipe -- the current room is filled with black, swiping from a specified direction, and then the black is removed in the same direction
    * Circle -- the current room is engulfed by black with a circular cutout, and then the new room is revealed by the cutout
    * Fade can be modified to fade to a particular color, swipe can be modified by specifying the direction of the swipe
  * Triggered by a collision with a room transition object
    * Allows developer to specify where the player object should be placed in the next room
    * Allows the developer to specify if the player object should have a vertical or horizontal speed applied to it (eg: should the character walk into the room)


* Menu System
  * ~~Allows menus to be created in the Room Editor~~
  * ~~Allows for navigation to occur via touch, mouse and keyboard, or controller~~
  * Allows buttons to have text, sprite, color, and action all set within the room editor or programmatically on the fly
  * Menus will put all game objects other than other menu elements into a frozen state, meaning pause menus can also be created easily in the room editor


* Inventory System
  * Allows for creating a versatile inventory system from a 2d array
  * Every inventory entry will contain:
    * Object index (eg: OBJ_Orange)
    * Object amount (eg: 3)
  * When selected from inventory, the object amount will drop (and be removed if necessary), and the inventory script function set in the object will be executed.
  * Three types of built-in Inventory can be displayed:
    * Simple List -- a small list of items is shown via text, with the selected entry being highlighted in a specified color; pressing as specified button will exit the list, and pressing another specified button will use an item; if the inventory is too large to show on screen, then a scroll bar will be displayed and the list will automatically scroll vertically; the names for the items are specified in the items themselves in an inventory name variable
    * Simple Pictures -- a small, wide box will be shown with one row of square boxes containing pictures of the inventory items, with the selected entry's box being highlighted a specified color and showing the item's name; pressing a specified button will exit the grid, and pressing another specified button will use an item; if the inventory is too large to show on screen, then a scroll bar will be displayed and the list will automatically scroll horizontally; the names for the items are specified in the items themselves in an inventory name variable; the sprites used are either the one specified in an inventory picture variable in the item itself, or the sprite assigned to the item by default
    * Big Grid -- a large box will be shown with many rows of square boxes containing pictures of the inventory items, with the selected entry's box being highlighted a specified color and showing the item's name; pressing a specified button will exit the grid, and pressing another specified button will use an item; if the inventory is too large to show on screen, then a scroll bar will be displayed and the list will automatically scroll vertically; the names for the items are specified in the items themselves in an inventory name variable; the sprites used are either the one specified in an inventory picture variable in the item itself, or the sprite assigned to the item by default
  * Inventories can be assigned several default sorting methods, or a custom one
    * Alphabetical based on item name
    * Chronological, based on when the item was put into the inventory (basically, no sorting)
    * Custom sorting method based on a specified variable in the items, themselves
    * Sorting is done every time an object is added to the inventory
  * Many inventories can be created, managed, sorted and displayed via a set of inventory functions


* Particles
  * Functions for creating common types of particles
    * Dust: specify an x and y, decay (def: random(3) second), speed (def: random(0.25)), direction (def: random(359)), and gravity (def: 0)
    * Ember: specify an x and y, decay (def: random(2) seconds), color (def: c_white), speed (def: random(2)), direction (def: 90), and gravity (def: 0)
    * Smoke: specify an x and y, decay (def: random(3) second), speed (def: random(0.5)), and direction (def: 90)
    * Impact: only callable from an object which has speed; will turn the calling object into an impact particle, doing the delete and create events
  * Dust will have a partially transparent light gray sprite, and only be a few pixels wide; unless given gravity, just floats slowly in a random direction
    * Good for showing impact when the player lands
    * Can be used when walking or running, or sliding on walls to show friction between surfaces and the object that is moving along them
    * Can be used in caves to create falling debris
    * Can be used to help animate items breaking
  * Ember will use a small fire-ball like sprite of just a few pixels width; works with the lighting engine; sprite and light are colored as specified
    * Good for adding animation to fires and torches
    * Can be used when defeating an enemy to give a flashy feel
    * Can be used to add animation to electricity sprites
    * Can be used to create fireflies
    * Can be used to add "lava bubbles" to magma pits or "lava drips" from ceilings
  * Smoke will have a somewhat larger sprite, and will be a light gray "cloud" of smoke; unlike dust and ember, can't be assigned gravity; fades over time
    * Good for adding animation to campfires
    * Can be used for other "cloudy" effects
  * Impact will have a monochrome sprite that will be a generic "explosion against a wall" type animation; for when firing a weapon into a wall
    * Good for calling when bullets collide with objects that halt the bullets' momentum
    * Can also be used when other objects like fireballs, lasers, etc. collide with any object which halt the movement of the projectile


* Function Queue Lists
  * Used to help animate in-game cutscenes
  * Create a function queue list and assign it to a variable
    * functionQueueList = create_function_queue_list();
  * Add functions to the queue
    * add_to_function_queue_list(queueList, object, function, delay);
    * queueList: the FQL to add this function to
    * object: the object which should perform the function (eg: if you want a character to walk left, this is the character that you want to move)
    * function: the function or script that will be stored (eg: if you want a character to execute the walk_left() script, then type "walk_left")
    * delay: amount of seconds to wait before executing this function (eg: you want the character to walk left 5 seconds after the last function executed)
  * Start the queue list, and then watch your objects perform the specified functions assigned to them in chronological and timed order


* Progression Checklist System
  * Tired of a million variables specifically used to just to keep the player from going places they aren't supposed to yet? Or having a million variables to control when certain NPC's say one line of text versus another based on where you are in the story? Or what about trying to implement achievements?
  * Adding a handful of functions to an object, you can track it's programming, variables and events
    * track_event(): call this at any point in any event to tell the Progression Checklist System that the calling object has performed the calling event
    * notify_progression_checklist_system(message): call this to pass a message to the Progression Checklist System from the calling object
  * Next, you create a progression checklist which will house all your progression checks and whether they have been completed or not
    * progressionChecklist = create_progression_checklist();
  * Now, add progression checks to the checklist
    * add_progression_check(progressionChecklist, name, description, object, objectSelector[optional], messageOrEvent);
    * progressionChecklist: the Progression Checklist to search against
    * name: a string of your choosing -- best to keep it simple
    * description: a string of your choosing -- only really used if you're using the Progression Checklist System for achievements or advancements
    * object: the object you're searching for a message or event from
    * objectSelector: name of a variable, or name and value of a variable (eg: only a ball with a variable "bounce", or only a ball where "bounce = true")
    * messageOrEvent: the type of event (use game maker's constants like ev_alarm) or the message (from notify_progression_checklist_system) to look for
  * The game will check this list every frame
  * If a message or event has been tracked from an object fitting the objectSelector, the system will automatically mark that progression check as completed
  * The game will only fire each progression check once
  * To check if a certain progression check has been completed use one of the below functions
    * check_progression(progressionChecklist, object, objectSelector[optional], messageOrEvent);
    * check_progression(progressionChecklist, name);
  * You can choose to search for progression status via the progression check's name or via the message / event that triggers it's completion
  * This will keep all your story progression checks in one organized list
  * This will allow you to search for progression checks via triggers rather than variables tucked away in some deep recess of your game's code
  * This allows you to display the progression checklist to the player in the form of advancements, achievements or an in-game checklist
    * show_progression_completions(progressionChecklist, descriptionOnly[def=true]) -- by default, only shows progress completions if they have a description
    * show_progression_checklist(progressionChecklist, descriptionOnly[default=true]) -- shows the player a list of the progression checks


* Various additional functions for simplifying common needs
  * File opening, reading, writing and closing
  * Item finding
  * List and array sorting and iteration
  * Chance and random-ness
  * Value wrapping and snapping
  * Checking for null (undefined, pointer_null, noone, asset_unknown, or empty arrays or lists)
  * Converting proper hex values to numbers (Game Maker insists for some reason that it's BBGGRR instead of RRGGBB)
  * Probably a WHOLE lot more
