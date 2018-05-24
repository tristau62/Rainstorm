#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "splash.h"
#include "text.h"
#include "tiletest.h"
#include "house.h"
#include "mainchar.h"
#include "pikachu7.h"
#include "TITLESONG.h"
/*I figured out the majority of the stuff out that I still need to do. I need to add the money and hit detectoin
as well as relplace the place holder sprites and fix up my states. I will add animations to the player and background
I still need a lot of work will be going on massive coding sessions in preparation for the final project.

*/
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int isLooping;
}SOUND;


typedef struct{
    int row;
    int col;
    int health;
    int speed;
    int size;
    int width;
    int height;
    int direction;
} SPRITE;
SPRITE player;
SPRITE s;
SPRITE c;
SPRITE o;
SPRITE r2;
SPRITE e;
SPRITE colon;
SPRITE hundreds;
SPRITE tens;
SPRITE ones;
SPRITE raindrop[11];
SPRITE money[2];

unsigned int buttons;
unsigned int oldButtons;

int score;
int scoreOnes;
int scoreTens;
int scoreHundreds;
int temp;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

enum {SPLASH, INSTRUCT, GAME, PAUSE, WIN, LOSE,};
int state = SPLASH;
char buffer [41];
OBJ_ATTR shadowOAM[128];

int main() {
    loadPalette(splashPal);
    REG_DISPCTL = MODE4 | BG2_ENABLE; //mode 4
    PALETTE[WHITEINDEX] = WHITE;
    PALETTE[BLACKINDEX] = BLACK;
    PALETTE[REDINDEX] = RED;
    PALETTE[BLUEINDEX] = BLUE;


    setupInterrupts();
    setupSounds();
    //playSoundA(TITLESONG, TITLESONGLEN, TITLESONGFREQ, 0);
    for(;;)
    {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch(state)
        {
            case SPLASH:
                splash();
                break;
            case INSTRUCT:
                instruct();
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }



    }
    return 0;

}

void splash() {

    flipPage();
    fillScreen4(BLACKINDEX);
    REG_DISPCTL = BG2_ENABLE | MODE4;
    videoBuffer = BUFFER1;



    loadPalette(splashPal);
    drawBackgroundImage4(splashBitmap);

    sprintf(buffer, "RAINSTORM");
    drawString4(60, 100, buffer, WHITE);
    sprintf(buffer, "Press A for information");
    drawString4(100, 32, buffer, BLACK);
    sprintf(buffer, "Press start to start the game");
    drawString4(110, 32, buffer, BLACK);
    waitForVblank();
    flipPage();




    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START))  {
            fillScreen4(BLACKINDEX);
            state = GAME;
            return;
        }
        if(BUTTON_PRESSED(BUTTON_A)) {
            fillScreen4(BLACKINDEX);
            state = INSTRUCT;
            return;
        }
    }
}

void instruct() {
    fillScreen4(BLACKINDEX);

    REG_DISPCTL = BG2_ENABLE | MODE4;
    videoBuffer = BUFFER1;

    drawBackgroundImage4(BLACKINDEX);
    PALETTE[WHITEINDEX] = WHITE;
    sprintf(buffer,"Instruction screen");
    drawString4(10,32,buffer, REDINDEX);
    sprintf(buffer,"Use the arrow keys to move");
    drawString4(50,32,buffer, WHITEINDEX);
    sprintf(buffer,"Try to collect the money");
    drawString4(60, 32,buffer, WHITEINDEX);
    sprintf(buffer,"Try to avoid the rain");
    drawString4(70, 32,buffer, WHITEINDEX);
    sprintf(buffer,"Press Start to begin the game");
    drawString4(110, 32,buffer, WHITEINDEX);

    waitForVblank();
    flipPage();

    while(1){
        oldButtons = buttons;
        buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START)){
            fillScreen4(BLACKINDEX);

            state = GAME;

            return;
        }


    }
}
void pause() {
    REG_DISPCTL = MODE4 | BG2_ENABLE;

    fillScreen4(BLACKINDEX);
    flipPage();
    drawBackgroundImage4(BLACKINDEX);
    sprintf(buffer,"Pause Screen");
    drawString4(10,32,buffer, WHITEINDEX);
    sprintf(buffer,"Press Start to unpause");
    drawString4(20,32,buffer, WHITEINDEX);

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START))  {
            fillScreen4(BLACKINDEX);
            state = GAME;
            return;
        }
        if(BUTTON_PRESSED(BUTTON_A)) {
            fillScreen4(BLACKINDEX);
            state = SPLASH;
            return;
        }
    }
}

void win() {
    fillScreen4(BLACKINDEX);
    sprintf(buffer,"You Win");
    drawString4(10,32,buffer, WHITEINDEX);
    sprintf(buffer,"Congratulations");
    drawString4(20,42,buffer, WHITEINDEX);
    sprintf(buffer,"Press start to restart");
    drawString4(30,42,buffer, WHITEINDEX);


    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START))  {
            fillScreen4(BLACKINDEX);
            state = SPLASH;
            return;
        }

    }
}

void lose() {
    fillScreen4(BLACKINDEX);
    sprintf(buffer,"You lose");
    drawString4(10,32,buffer, WHITEINDEX);
    sprintf(buffer,"Congratulations");
    drawString4(10,42,buffer, WHITEINDEX);

     while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START))  {
            fillScreen4(BLACKINDEX);
            state = SPLASH;
            return;
        }

    }
}
void game() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0 | COLOR256;

    loadPalette(housePal);
    DMANow(3, (unsigned int*)houseTiles, &CHARBLOCKBASE[0], houseTilesLen/2);
    DMANow(3, (unsigned int*)houseMap, &SCREENBLOCKBASE[27], houseMapLen/2);

    DMANow(3, Pikachu7Tiles, &CHARBLOCKBASE[4], Pikachu7TilesLen/2);
    DMANow(3, Pikachu7Pal, SPRITE_PALETTE, 256);

    hideSprites();
    initialize();

    while(1)
    {
        oldButtons = buttons;
        buttons = BUTTONS;
        updateOAM();
        int i; for(i=1; i < 11;i++) {
            if (raindrop[i].row > 105) {
                raindrop[i].row = rand() %20;
                raindrop[i].col = rand() %241;
            }
        }
        int z; for(z=0; z < 3;z++) {
            if (money[z].row > 105) {
                money[z].row = rand() %20;
                money[z].col = rand() %241;
            }
        }


        if(BUTTON_HELD(BUTTON_LEFT)) {
            if (player.col != 0) {
                player.col--;
            }
        }
        if(BUTTON_HELD(BUTTON_RIGHT)) {
            if (player.col != 224) {
                player.col++;
            }
        }

        if(BUTTON_PRESSED(BUTTON_START))  {
            fillScreen4(BLACKINDEX);

            state = PAUSE;
            return;
        }
        if(BUTTON_PRESSED(BUTTON_SELECT))  {
            fillScreen4(BLACKINDEX);
            loadPalette(splashPal);
            state = SPLASH;
            return;
        }


        int x;for(x = 1; x<11; x++) {
        int collision = checkHit(player.row,player.col,raindrop[x].row,raindrop[x].col);
        if (collision){
            fillScreen4(BLACKINDEX);
            loadPalette(splashPal);
            state = SPLASH;
            return;
        }
        int a; for(a=0; a<3;a++) {
        int collision2 = checkHit(player.row,player.col,money[a].row,money[a].col);
        if (collision2) {
            money[a].row = rand() %20;
            money[a].col = rand() %241;
            score++;
        }
        }
    }
        updateDrops();
        updateNums();

        DMANow(3, shadowOAM, OAM, 512);
        waitForVblank();
    }
    return 0;




}
void hideSprites()
{
    int i;for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void updateOAM()
{
    shadowOAM[0].attr0 = (ROWMASK & player.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SIZE16;
    shadowOAM[0].attr2 = SPRITEOFFSET16(0,0);

    int i; for(i=1; i<11; i++) {

        shadowOAM[i].attr0 = (ROWMASK & raindrop[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[i].attr1 = (COLMASK & raindrop[i].col) | ATTR1_SIZE8;
        shadowOAM[i].attr2 = SPRITEOFFSET16(6,0);

    }
    int x; for(x=11; x < 14; x++) {
        shadowOAM[x].attr0 = (ROWMASK & money[x-11].row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[x].attr1 = (COLMASK & money[x-11].col) | ATTR1_SIZE8;
        shadowOAM[x].attr2 = SPRITEOFFSET16(8,1);
    }
    shadowOAM[14].attr0 = (ROWMASK & s.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[14].attr1 = (COLMASK & s.col) | ATTR1_SIZE8;
    shadowOAM[14].attr2 = SPRITEOFFSET16(7,0);

    shadowOAM[15].attr0 = (ROWMASK & c.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[15].attr1 = (COLMASK & c.col) | ATTR1_SIZE8;
    shadowOAM[15].attr2 = SPRITEOFFSET16(7,1);

    shadowOAM[16].attr0 = (ROWMASK & o.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[16].attr1 = (COLMASK & o.col) | ATTR1_SIZE8;
    shadowOAM[16].attr2 = SPRITEOFFSET16(7,2);

    shadowOAM[18].attr0 = (ROWMASK & r2.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[18].attr1 = (COLMASK & r2.col) | ATTR1_SIZE8;
    shadowOAM[18].attr2 = SPRITEOFFSET16(7,3);

    shadowOAM[17].attr0 = (ROWMASK & e.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[17].attr1 = (COLMASK & e.col) | ATTR1_SIZE8;
    shadowOAM[17].attr2 = SPRITEOFFSET16(7,4);

    shadowOAM[19].attr0 = (ROWMASK & colon.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[19].attr1 = (COLMASK & colon.col) | ATTR1_SIZE8;
    shadowOAM[19].attr2 = SPRITEOFFSET16(7,5);

    shadowOAM[20].attr0 = (ROWMASK & hundreds.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[20].attr1 = (COLMASK & hundreds.col) | ATTR1_SIZE8;
    shadowOAM[20].attr2 = SPRITEOFFSET16(5,scoreHundreds);

    shadowOAM[21].attr0 = (ROWMASK & tens.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[21].attr1 = (COLMASK & tens.col) | ATTR1_SIZE8;
    shadowOAM[21].attr2 = SPRITEOFFSET16(5,scoreTens);

    shadowOAM[22].attr0 = (ROWMASK & ones.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[22].attr1 = (COLMASK & ones.col) | ATTR1_SIZE8;
    shadowOAM[22].attr2 = SPRITEOFFSET16(5,scoreOnes);

}
void initialize()
{
   score = 0;

   player.width = 16;
   player.height = 16;

   player.row = 99;
   player.col = 120;


   int i; for(i = 1; i<11; i++) {
        raindrop[i].col = rand() %241;
        raindrop[i].row = rand() % 20;
   }
   int x; for(x=0; x<3; x++) {
        money[x].col = rand() % 241;
        money[x].row = rand() % 20;
   }

   s.row = 145;
   s.col = 10;

   c.row = 145;
   c.col = 18;

   o.row = 145;
   o.col = 26;

   r2.row = 145;
   r2.col = 34;

   e.row = 145;
   e.col = 42;

   colon.row = 145;
   colon.col = 50;

   hundreds.row = 145;
   hundreds.col = 58;

   tens.row = 145;
   tens.col = 66;

   ones.row = 145;
   ones.col = 74;

}

void updateDrops() {
    int i;for(i=1; i<11; i++) {

        raindrop[i].row++;

    }
    int x;for(x=0; x<2; x++) {
        money[x].row++;
    }
}
void setupSounds()
{
        REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                        DSA_OUTPUT_RATIO_100 |
                        DSA_OUTPUT_TO_BOTH |
                        DSA_TIMER0 |
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 |
                        DSB_OUTPUT_TO_BOTH |
                        DSB_TIMER1 |
                        DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}
void playSoundA( const unsigned char* sound, int length, int frequency, int isLooping) {


        dma[1].cnt = 0;
        vbCountA = 0;

        int interval = 16777216/frequency;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;

        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
         soundA.length = length;
         soundA.frequency = frequency;
         soundA.data = sound;
         soundA.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;

}
void playSoundB( const unsigned char* sound, int length, int frequency, int isLooping) {

        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;

        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
         soundB.length = length;
         soundB.frequency = frequency;
         soundB.data = sound;
         soundB.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;

}
void setupInterrupts()
{
    REG_IME = 0;
    REG_INTERRUPT = (unsigned int)interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}
void interruptHandler()
{
    REG_IME = 0;
    if(REG_IF & INT_VBLANK)
    {
                /**
                 * MODIFY THIS FUNCTION
                 * Place your code to loop and stop sounds here.
                 */

         if (soundA.duration == vbCountA) {
            //playSoundA(TITLESONG, TITLESONGLEN, TITLESONGFREQ, 0);
        }

        /*if (state == SPLASH) {
            vbCountA++;
        }
        if (state == GAME) {
            vbCountA++;
        }
        */
        vbCountA++;

        REG_IF = INT_VBLANK;
    }

    REG_IME = 1;
}
void collision()
{
    int i;
    for(i = 1; i<21; i++) {
        int collision = checkHit(player.row,player.col,raindrop[i].row,raindrop[i].col);
        if (collision){
            fillScreen4(BLACKINDEX);
            loadPalette(splashPal);
            state = SPLASH;
            return;
        }
    }
}
void updateNums()
{
    scoreHundreds = (score / 100) % 10;
    scoreTens = (score / 10) % 10;
    scoreOnes = score % 10;
}
