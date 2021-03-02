#ifndef _KOLIZJE
#define _KOLIZJE

#include "includes.h"

bool kolizja_gora(Czolg tank, Pole **tab, Czolg *czolgi, int n);

bool kolizja_dol(Czolg tank, Pole **tab, Czolg *czolgi, int n);

bool kolizja_lewo(Czolg tank, Pole **tab, Czolg *czolgi, int n);

bool kolizja_prawo(Czolg tank, Pole **tab, Czolg *czolgi, int n);

bool pocisk_w_sciane(Tekstura pocisk, Pole **tab, bool strz);

bool pocisk_w_czolg(Czolg tank, Czolg *czolgi, int n, Wybuch *wyb);

#endif
