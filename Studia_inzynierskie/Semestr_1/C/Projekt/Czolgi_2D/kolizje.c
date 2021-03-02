#include "kolizje.h"

bool kolizja_gora ( Czolg tank, Pole **tab, Czolg *czolgi, int n )
{
    int x_1 = ( tank.teks.x + 5 ) / BOK_POLA;
    int y_1 = ( tank.teks.y + 1 ) / BOK_POLA;
    int x_2 = ( tank.teks.x + tank.teks.szer - 5 ) / BOK_POLA;
    int y_2 = ( tank.teks.y + 1 ) / BOK_POLA;

    if ( tab[y_1][x_1].rodzaj == SCIANA || tab[y_2][x_2].rodzaj == SCIANA || tab[y_1][x_1].rodzaj == CEGLY || tab[y_2][x_2].rodzaj == CEGLY )
    {
        return true;
    }

    for ( int i = 0; i < n; i++ )
    {
        if ( tank.id != i )
        {
            if ( ( tank.teks.x + tank.teks.szer ) >= czolgi[i].teks.x + 8 && tank.teks.x <= ( czolgi[i].teks.x + czolgi[i].teks.szer - 8 )
                    && tank.teks.y <= ( czolgi[i].teks.y + czolgi[i].teks.wys ) && ( tank.teks.y + tank.teks.wys ) >= ( czolgi[i].teks.y + 5 ) )
            {
                return true;
            }
        }
    }

    return false;
}

bool kolizja_dol ( Czolg tank, Pole **tab, Czolg *czolgi, int n )
{
    int x_1 = ( tank.teks.x + 5 ) / BOK_POLA;
    int y_1 = ( tank.teks.y + tank.teks.wys - 1 ) / BOK_POLA;
    int x_2 = ( tank.teks.x + tank.teks.szer - 5 ) / BOK_POLA;
    int y_2 = ( tank.teks.y + tank.teks.wys - 1 ) / BOK_POLA;

    if ( tab[y_1][x_1].rodzaj == SCIANA || tab[y_2][x_2].rodzaj == SCIANA || tab[y_1][x_1].rodzaj == CEGLY || tab[y_2][x_2].rodzaj == CEGLY )
    {
        return true;
    }

    for ( int i = 0; i < n; i++ )
    {
        if ( tank.id != i )
        {
            if ( ( tank.teks.x + tank.teks.szer ) >= czolgi[i].teks.x + 8 && tank.teks.x <= ( czolgi[i].teks.x + czolgi[i].teks.szer - 8 )
                    && ( tank.teks.y + tank.teks.wys ) >= ( czolgi[i].teks.y ) && tank.teks.y <= ( czolgi[i].teks.y + czolgi[i].teks.wys - 5 ) )
            {
                return true;
            }
        }
    }

    return false;
}

bool kolizja_lewo ( Czolg tank, Pole **tab, Czolg *czolgi, int n )
{
    int x_1 = ( tank.teks.x + 1 ) / BOK_POLA;
    int y_1 = ( tank.teks.y + 5 ) / BOK_POLA;
    int x_2 = ( tank.teks.x + 1 ) / BOK_POLA;
    int y_2 = ( tank.teks.y + tank.teks.wys - 5 ) / BOK_POLA;

    if ( tab[y_1][x_1].rodzaj == SCIANA || tab[y_2][x_2].rodzaj == SCIANA || tab[y_1][x_1].rodzaj == CEGLY || tab[y_2][x_2].rodzaj == CEGLY )
    {
        return true;
    }

    for ( int i = 0; i < n; i++ )
    {
        if ( tank.id != i )
        {
            if ( ( tank.teks.y + tank.teks.wys ) >= ( czolgi[i].teks.y + 8 ) && tank.teks.y <= ( czolgi[i].teks.y + czolgi[i].teks.wys - 8 )
                    && tank.teks.x <= ( czolgi[i].teks.x + czolgi[i].teks.szer ) && ( tank.teks.x + tank.teks.szer ) >= czolgi[i].teks.x + 5 )
            {
                return true;
            }
        }
    }

    return false;
}

bool kolizja_prawo ( Czolg tank, Pole **tab, Czolg *czolgi, int n )
{
    int x_1 = ( tank.teks.x + tank.teks.szer - 1 ) / BOK_POLA;
    int y_1 = ( tank.teks.y + 5 ) / BOK_POLA;
    int x_2 = ( tank.teks.x + tank.teks.szer - 1 ) / BOK_POLA;
    int y_2 = ( tank.teks.y + tank.teks.wys - 5 ) / BOK_POLA;

    if ( tab[y_1][x_1].rodzaj == SCIANA || tab[y_2][x_2].rodzaj == SCIANA || tab[y_1][x_1].rodzaj == CEGLY || tab[y_2][x_2].rodzaj == CEGLY )
    {
        return true;
    }

    for ( int i = 0; i < n; i++ )
    {
        if ( tank.id != i )
        {
            if ( ( tank.teks.y + tank.teks.wys ) >= ( czolgi[i].teks.y + 8 ) && tank.teks.y <= ( czolgi[i].teks.y + czolgi[i].teks.wys - 8 )
                    && (tank.teks.x+tank.teks.szer)>=czolgi[i].teks.x && (tank.teks.x+tank.teks.szer)<=czolgi[i].teks.x+8)
            {
                return true;
            }
        }
    }

    return false;
}


bool pocisk_w_sciane ( Tekstura pocisk, Pole **tab, bool strz )
{
    int x = ( pocisk.x + pocisk.szer / 2 ) / BOK_POLA;
    int y = ( pocisk.y + pocisk.wys / 2 ) / BOK_POLA;

    if ( strz == false )
    {
        return false;
    }

    if ( tab[y][x].rodzaj == CEGLY )
    {
        tab[y][x].wytrzymalosc--;

        if ( tab[y][x].wytrzymalosc == 0 )
        {
            tab[y][x].rodzaj = NIC;
        }

        return true;
    }

    else if ( tab[y][x].rodzaj == SCIANA )
    {
        return true;
    }

    else
    {
        return false;
    }
}

bool pocisk_w_czolg(Czolg tank, Czolg *czolgi, int n, Wybuch *wyb)
{
    int x_p = tank.pocisk.x+tank.pocisk.szer/2;
    int y_p = tank.pocisk.y+tank.pocisk.wys/2;
    for (int i=0; i<n; i++)
    {
        if (tank.id != i)
        {
            if (x_p>=czolgi[i].teks.x && x_p<=(czolgi[i].teks.x+czolgi[i].teks.szer)
                && y_p>=czolgi[i].teks.y && y_p<=(czolgi[i].teks.y+czolgi[i].teks.wys))
                {
                    if ((tank.id==0 && i>0) || (tank.id>0 && i==0))
                    {
                        czolgi[i].hp--;
                        if (czolgi[i].hp<=0)
                        {
                            wyb->teks.x = czolgi[i].teks.x-12;
                            wyb->teks.y = czolgi[i].teks.y-12;
                            wyb->boom=true;
                            czolgi[i].teks.x=780;
                            czolgi[i].teks.y=0;
                        }
                    }
                    return true;
                }
        }
    }
    return false;
}
