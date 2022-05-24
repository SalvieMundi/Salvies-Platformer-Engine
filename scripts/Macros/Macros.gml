// MIN_BLOCK_WD : the minimum amount any solid block in the game can be.
// if a block is smaller than this number in pixels, it can potentially
// be passed through, skipping collision events with blocks. purely 
// used to save performance when many physics objects appear together on
// the screen. lower numbers cost performance, but are potentially more
// "accurate."
#macro MIN_BLOCK_WD 7

// LIGHTING_DEPTH : what layer depth the lighting is drawn between. Any
// objects with a depth greater than the max or less than the min will 
// not cast shadows or interact with lighting in any way. All objects 
// with a depth between these numbers and with the proper shadow caster 
// variables initialized will cast shadows
#macro LIGHTING_DEPTH_MAX 100
#macro LIGHTING_DEPTH_MIN -100

// LIGHT_WD & LIGHT_HT : gets the size of the lighting sprite once at 
// the start of the game so it doesn't need to be re-evaluated
#macro LIGHT_WD sprite_get_width(SPR_GaussianLight)
#macro LIGHT_HT sprite_get_height(SPR_GaussianLight)

// FLICKERS : easy to remember flicker amounts for lights
// NONE : saves performance as light won't need to be redrawn
// STANDARD : gives gaussian some life but won't affect others
// FIRE : light flickers nicely with all light types
#macro FLICKER_NONE 0
#macro FLICKER_STANDARD 0.6
#macro FLICKER_FIRE 1.05

// LIGHT_FRAMESKIP : the factor by which lighting is updated. If this 
// factor is 1/2, or 0.5, for example, lighting will only be updated 
// at half the frame rate of the rest of the game (30fps if the game is
// 60fps, for example). Massive performance boost, but can look
// terrible, especially when shadowcasting is turned on.
/* 
   NOTE: THE ENGINE ALREADY ENGAGES A FRAME SKIP FACTOR OF 0.5 IF THE 
   GAME IS RUNNING BELOW THE TARGET FPS SPECIFIED IN GAME MAKER'S GAME 
   OPTIONS. IF THIS MACRO IS SET TO A FACTOR OTHER THAN 1, AND YOUR 
   GAME'S FPS FALLS BELOW THE INTENDED FRAME RATE, THEN THE AUTOMATIC
   FRAME SKIP WILL ENABLE AND COMPOUND THIS VALUE.
*/
#macro LIGHT_FRAMESKIP 1


// GAME_FPS : the fps the game *should* run at according to the setting 
// specified in Game Maker's Game Options
#macro GAME_FPS game_get_speed(gamespeed_fps)
