
//{{BLOCK(house)

//======================================================================
//
//	house, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 23 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 1472 + 2048 = 4032
//
//	Time-stamp: 2015-04-07, 19:05:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 1472
extern const unsigned short houseTiles[736];

#define houseMapLen 2048
extern const unsigned short houseMap[1024];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)
