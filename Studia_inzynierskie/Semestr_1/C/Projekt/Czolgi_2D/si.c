#include "si.h"

Czolg ruch_komputera(Czolg tank, Pole **plansza, Czolg *czolgi, int n, Czolg gracz)
{
  if (tank.strzal==false)
  tank = ustaw_pocisk(tank);
  switch (tank.kier)
  {
    case W_DOL:
    {
      if (kolizja_dol(tank, plansza, czolgi, n))
      {
        tank.kier=W_GORE;

      }
      else
      {
        if (tank.ruch==true)
        tank.teks.y++;
        if (gracz.teks.y>tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
        {
          if (!przeszkoda(tank, gracz, plansza))
          tank.strzal=true;
        }
      }

      break;
    }
    case W_GORE:
    {
      if (!kolizja_gora(tank, plansza, czolgi, n))
      {
        if (tank.ruch==true)
        tank.teks.y--;
        if (gracz.teks.y<tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
        {
          if (!przeszkoda(tank, gracz, plansza))
          tank.strzal=true;
        }
      }
      else
      {
        tank.kier=W_DOL;
      }

      break;
    }
    case W_LEWO:
    {
      if (!kolizja_lewo(tank, plansza, czolgi, n))
      {
        if (tank.ruch==true)
        tank.teks.x--;
        if (gracz.teks.x<tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
        {
          if (!przeszkoda(tank, gracz, plansza))
          tank.strzal=true;
        }
      }
      else
      {
        tank.kier=W_PRAWO;
      }

      break;
    }
    case W_PRAWO:
    {
      if (!kolizja_prawo(tank, plansza, czolgi, n))
      {
        if (tank.ruch==true)
        tank.teks.x++;
        if (gracz.teks.x>tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
        {
          if (!przeszkoda(tank, gracz, plansza))
          tank.strzal=true;
        }
      }
      else
      {
        tank.kier=W_LEWO;
      }

      break;
    }
  }

  return tank;
}


Czolg obrot(Czolg tank, Czolg gracz, Pole **plansza)
{
  Czolg pom = tank;
  switch (tank.kier)
  {
      case W_GORE:
      {
        if (gracz.teks.y>tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
        {
          pom.kier = W_DOL;
          if (!przeszkoda(pom, gracz, plansza))
          tank.kier = W_DOL;
        }
        break;
      }

      case W_DOL:
      {
        if (gracz.teks.y<tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
        {
          pom.kier = W_GORE;
          if (!przeszkoda(pom, gracz, plansza))
          tank.kier = W_GORE;
        }
        break;
      }

      case W_LEWO:
      {
        if (gracz.teks.x>tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
        {
          pom.kier = W_PRAWO;
          if (!przeszkoda(pom, gracz, plansza))
          tank.kier = W_PRAWO;
        }
        break;
      }

      case W_PRAWO:
      {
        if (gracz.teks.x<tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
        {
          pom.kier = W_LEWO;
          if (!przeszkoda(pom, gracz, plansza))
          tank.kier = W_LEWO;
        }
        break;
      }
  }

  return tank;
}

Czolg obrot2(Czolg tank, Czolg gracz, Pole **plansza)
{
  if (gracz.teks.y>tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
  {
    if (!przeszkoda(tank, gracz, plansza))
    tank.kier=W_DOL;
  }
  else if (gracz.teks.y<tank.teks.y && gracz.teks.x<=(tank.teks.x+tank.teks.szer/2) && ((gracz.teks.x+gracz.teks.szer)>=(tank.teks.x+tank.teks.szer/2)))
  {
    if (!przeszkoda(tank, gracz, plansza))
    tank.kier = W_GORE;
  }
  else if (gracz.teks.x<tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
  {
    if (!przeszkoda(tank, gracz, plansza))
    tank.kier = W_LEWO;
  }
  if (gracz.teks.x>tank.teks.x && gracz.teks.y<=(tank.teks.y+tank.teks.wys/2) && ((gracz.teks.y+gracz.teks.wys)>=(tank.teks.y+tank.teks.wys/2)))
  {
    if (!przeszkoda(tank, gracz, plansza))
    tank.kier=W_PRAWO;
  }

  return tank;
}

bool przeszkoda(Czolg tank, Czolg gracz, Pole **plansza)
{
    int x_t = (tank.teks.x+tank.teks.szer/2)/BOK_POLA;
    int y_t = (tank.teks.y+tank.teks.wys/2)/BOK_POLA;

    int x_g = (gracz.teks.x+gracz.teks.szer/2)/BOK_POLA;
    int y_g = (gracz.teks.y+gracz.teks.wys/2)/BOK_POLA;

    if (tank.kier == W_GORE)
    {
        for (int i=y_t; i>=y_g; i--)
        {
          if (plansza[i][x_t].rodzaj==SCIANA)
            {
              return true;
            }
        }
    }
    else if (tank.kier == W_DOL)
    {
      for (int i=y_t; i<=y_g; i++)
      {
        if (plansza[i][x_t].rodzaj==SCIANA)
          {
            return true;
          }
      }
    }
    else if (tank.kier == W_LEWO)
    {
      for (int i=x_t; i>=x_g; i--)
      {
        if (plansza[y_t][i].rodzaj==SCIANA)
          {
            return true;
          }
      }
    }
    else if (tank.kier == W_PRAWO)
    {
      for (int i=x_t; i<=x_g; i++)
      {
        if (plansza[y_t][i].rodzaj==SCIANA)
          {
            return true;
          }
      }
    }

    return false;
}
