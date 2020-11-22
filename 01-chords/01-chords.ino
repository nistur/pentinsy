#include "penti.h"

#include "layout-base.h"
#include "layout-US.h"
#include <Bounce.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

unsigned char current_press = 0;
char click_count = 0;
int click_time = 0;
unsigned char click_lock = 0;
long unsigned int click_stack = 0x00000000;
unsigned char prev = 0;

void press(unsigned char key)
{
  char msg[2] = {(char)key, 0x00};
  Keyboard.print(msg);
}

// these are reversed, because I wired them up that way
Bounce buttonREPEAT = Bounce(PIN_B5, 10);
Bounce buttonSPACE = Bounce(PIN_B4, 10);
Bounce buttonS = Bounce(PIN_B3, 10);
Bounce buttonE = Bounce(PIN_B2, 10);
Bounce buttonI = Bounce(PIN_B1, 10);
Bounce buttonN = Bounce(PIN_B0, 10);

void setup()
{
  pinMode(PIN_B0, INPUT_PULLUP);
  pinMode(PIN_B1, INPUT_PULLUP);
  pinMode(PIN_B2, INPUT_PULLUP);
  pinMode(PIN_B3, INPUT_PULLUP);
  pinMode(PIN_B4, INPUT_PULLUP);
  pinMode(PIN_B5, INPUT_PULLUP); 

}

void loop() 
{
  ++click_time;
  buttonSPACE.update();
  buttonS.update();
  buttonE.update();
  buttonI.update();
  buttonN.update();
  buttonREPEAT.update();
  
  if( buttonSPACE.fallingEdge() )
  {
    current_press |= K_1;
    click_stack = (click_stack << 5) | K_1;
    ++click_count;
    click_time = 0;
  }
  if( buttonS.fallingEdge() )
  {
    current_press |= K_2;
    click_stack = (click_stack << 5) | K_2;
    ++click_count;
    click_time = 0;
  }
  if( buttonE.fallingEdge() )
  {
    current_press |= K_3;
    click_stack = (click_stack << 5) | K_3;
    ++click_count;
    click_time = 0;
  }
  if( buttonI.fallingEdge() )
  {
    current_press |= K_4;
    click_stack = (click_stack << 5) | K_4;
    ++click_count;
    click_time = 0;
  }
  if( buttonN.fallingEdge() )
  {
    current_press |= K_5;
    click_stack = (click_stack << 5) | K_5;
    ++click_count;
    click_time = 0;
  }

  if( buttonSPACE.risingEdge() ||
    buttonS.risingEdge() ||
    buttonE.risingEdge() ||
    buttonI.risingEdge() ||
    buttonN.risingEdge() )
  {
    if( click_time < 2400 && click_count > 1 )
    {
      current_press = 0;
      const arpeggio* a = &arpeggios[0];
      while(a->combo != 0xFFFFFFFF)
      {
        if(a->combo == click_stack)
        {
          a->fn();
          break;
        }
        ++a;
      }
      click_count = 0;
      click_time = 0;
      click_stack = 0x00000000;
    }
    else
    {
      
      if( click_count > 0 && --click_count  <= 0 )
      {
        prev = keymap[(int)current_press];
        if(prev != FUNC)
        {
          press(prev);
        }
        else
        {          
          const func* f = &funcs[0];
          while(f->ident != 0xFF)
          {
            if(f->ident == current_press)
            {
              Keyboard.press(f->arg.key);
              Keyboard.release(f->arg.key);
              break;
            }
            ++f;
          }
        }
        current_press = click_lock;
        click_count = 0;
        click_time = 0;
        click_stack = 0x00000000;
      }
    } 
  }
  
  if( buttonREPEAT.risingEdge() )
  {
    press(prev);
  }
}

void del()
{
  Keyboard.press(KEY_BACKSPACE);
  Keyboard.release(KEY_BACKSPACE);
}
void ret()
{
  Keyboard.press(KEY_RETURN);
  Keyboard.release(KEY_RETURN);
}
void esc()
{
  Keyboard.press(KEY_ESC);
  Keyboard.release(KEY_ESC);
}
void tab()
{
  Keyboard.press(KEY_TAB);
  Keyboard.release(KEY_TAB);
}

MODIFIER(shift, S)
MODIFIER(punct, P)
MODIFIER(digit, D)
MODIFIER(altgr, A)
MODIFIER(funct, F)
