#ifndef PENTI_H
#define PENTI_H

#define K_1  0b00000001
#define K_2  0b00000010
#define K_3  0b00000100
#define K_4  0b00001000
#define K_5  0b00010000
#define MODE 0b11100000
#define M_S  0b00100000
#define M_P  0b01000000
#define M_D  0b01100000
#define M_A  0b10000000
#define M_F  0b10100000

#define FUNC 0xFF

#define ARPEGGIO(a,b) ((a << 5) | (b))

typedef struct
{
  long unsigned int combo;
  void(*fn)();
} arpeggio;

typedef union
{
    unsigned int key;
    char pot[4];
} Arg;

typedef struct
{
  unsigned char ident;
  const Arg arg;
} func;

extern unsigned char current_press;
extern char click_count;
extern int click_time;
extern unsigned char click_lock;
extern long unsigned int click_stack;
extern unsigned char prev;



#define MODIFIER(name, sym) \
void name()                 \
{                           \
  if(click_lock & M_##sym)  \
  {                         \
    click_lock &= ~M_##sym; \
  }                         \
  else                      \
  {                         \
    current_press = M_##sym;\
  }                         \
}                           \
void name##lock()           \
{                           \
  if(click_lock & M_##sym)  \
  {                         \
    click_lock &= ~M_##sym; \
  }                         \
  else                      \
  {                         \
    click_lock = M_##sym;   \
  }                         \
  current_press = click_lock;\
}
#endif/*PENTI_H*/
