
void shift();
void shiftlock();
void punct();
void punctlock();
void digit();
void digitlock();
void altgr();
void altgrlock();
void funct();
void functlock();

void del();
void ret();
void esc();
void tab();

const arpeggio arpeggios[] = 
{
  {ARPEGGIO(K_1, K_2), shift},
  {ARPEGGIO(K_2, K_1), shiftlock},
  {ARPEGGIO(K_1, K_3), punct}, 
  {ARPEGGIO(K_3, K_1), punctlock}, 
  {ARPEGGIO(K_1, K_4), digit}, 
  {ARPEGGIO(K_4, K_1), digitlock}, 
  {ARPEGGIO(K_2, K_5), altgr}, 
  {ARPEGGIO(K_5, K_2), altgrlock}, 
  {ARPEGGIO(K_3, K_4), funct}, 
  {ARPEGGIO(K_4, K_3), functlock}, 

  {ARPEGGIO(K_2, K_4), ret}, 
  {ARPEGGIO(K_4, K_2), esc}, 
  {ARPEGGIO(K_2, K_3), tab}, 
  {ARPEGGIO(K_3, K_2), del},
  {0xFFFFFFFF, 0}
};

const func funcs[] =
{
  {M_D | K_1 | K_3 | K_4,               KEY_LEFT},
  {M_D | K_5,                           KEY_RIGHT},
  {M_D | K_1 | K_2 | K_3,               KEY_UP},
  {M_D | K_2 | K_4 | K_5,               KEY_DOWN},

  {M_D | K_1 | K_2 | K_4,               KEY_PAGE_UP},
  {M_D | K_1 | K_2 | K_4 | K_5,         KEY_PAGE_DOWN},
  
  {M_D | K_1 | K_2 | K_5,               KEY_HOME},
  {M_D | K_1 | K_2 | K_3,               KEY_END},
  {M_D | K_1 | K_2 | K_3 | K_4 | K_5,   KEY_INSERT},
  
  {M_F | K_1 | K_3 | K_4,   KEY_PAUSE},
  
  {M_F | K_2,   KEY_F1},
  {M_F | K_3,   KEY_F2},
  {M_F | K_4,   KEY_F3},
  {M_F | K_1 | K_2,   KEY_F4},
  {M_F | K_1 | K_3,   KEY_F5},
  {M_F | K_1 | K_4,   KEY_F6},
  {M_F | K_2 | K_3,   KEY_F7},
  {M_F | K_3 | K_4,   KEY_F8},
  {M_F | K_4 | K_5,   KEY_F9},
  {M_F | K_2 | K_3 | K_4,   KEY_F10},
  {M_F | K_1 | K_2 | K_3,   KEY_F11},
  {M_F | K_3 | K_4 | K_5,   KEY_F12},
  
  {0xFF, 0},
};
