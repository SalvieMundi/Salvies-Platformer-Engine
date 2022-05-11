// MIN_BLOCK_WD : the minimum amount any solid block in the game can be.
// if a block is smaller than this number in pixels, it can potentially
// be passed through, skipping collision events with blocks. purely 
// used to save performance when many physics object appear together on
// the screen. lower numbers cost performance, but are potentially more
// "accurate."
#macro MIN_BLOCK_WD 7