#include <gtk/gtk.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <complex.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

GtkWidget *image;
GtkWidget *lewo;
GtkWidget *prawo;
GtkWidget *gora;
GtkWidget *dol;
GtkWidget *h_box;
GtkWidget *window;
GtkWidget *v_box;



static void
put_pixel (GdkPixbuf *pixbuf, int x, int y, guchar red, guchar green, guchar blue)
{
  int width, height, rowstride, n_channels;
  guchar *pixels, *p;

  n_channels = gdk_pixbuf_get_n_channels (pixbuf);


  width = gdk_pixbuf_get_width (pixbuf);
  height = gdk_pixbuf_get_height (pixbuf);

  g_assert (x >= 0 && x < width);
  g_assert (y >= 0 && y < height);

  rowstride = gdk_pixbuf_get_rowstride (pixbuf);
  pixels = gdk_pixbuf_get_pixels (pixbuf);

  p = pixels + y * rowstride + x * n_channels;
  p[0] = red;
  p[1] = green;
  p[2] = blue;
}


bool granica(float y, float x)
{
    complex float z = x + y*I;
    complex float a = z;

    for (int i=0; i<=50; i++)
    {
        if (creal(z)*creal(z)+cimag(z)*cimag(z)>4)
        {
            return false;
        }
        z = z*z+a;
    }

    return true;
}

int granica2(float y, float x, float bok)
{
    int avg = 0;
    int krok = bok / 5;
    y=y+bok/10;
    x=x+bok/10;
    float x_p = x, y_p = y;



    for ( int k = 0; k < 5; k++ )
    {
        y_p=y+krok*k;
        for ( int l = 0; l < 5; l++ )
        {
            x_p=x+krok*k;
            complex float z=x_p+y_p*I;
            complex float a=z;
            for ( int i = 0; i <= 50; i++ )
            {
                if ( creal ( z ) *creal ( z ) + cimag ( z ) *cimag ( z ) > 4 )
                {
                    avg+=i;
                    break;
                }

                z = z * z + a;
            }
        }
    }
    avg/=25;
   return 256-8*avg;

}

void oblicz()
{

    float left = atof(gtk_entry_get_text (GTK_ENTRY(lewo)));
    float right = atof(gtk_entry_get_text (GTK_ENTRY(prawo)));
    float top = atof(gtk_entry_get_text (GTK_ENTRY(gora)));
    float down = atof(gtk_entry_get_text (GTK_ENTRY(dol)));

    GdkPixbuf *pixbuf;

    pixbuf = gtk_image_get_pixbuf (GTK_IMAGE(image));
    int pikseli = 300;
    float wys_p=0, szer_p=0;
    float wys =down-top;
    float szer =right - left;

    if (wys>szer)
    {
        wys_p=pikseli;
        szer_p=pikseli*(szer/wys);
    }
    else
    {
        szer_p=pikseli;
        wys_p=pikseli*(wys/szer);
    }

    float bok_piksela = szer/szer_p;

    for ( int i = 0; i < pikseli; i++ )
    {
        for ( int j = 0; j < pikseli; j++ )
        {
            if ( granica ( top + i * bok_piksela, left + j * bok_piksela ) )
            {
                put_pixel ( pixbuf, j, i, 0, 0, 0 );
            }

            else
            {
                int x=granica2 ( top + i*bok_piksela, left + j * bok_piksela, bok_piksela);
                put_pixel (pixbuf, j, i, x, x, x);
            }
        }
    }

    gdk_pixbuf_save (pixbuf, "plik", "bmp",NULL, NULL);
    gtk_image_set_from_file (GTK_IMAGE(image),"plik");

}

static void activate ( GtkApplication *app, gpointer user_data )
{

    GtkWidget *grid;
    GtkWidget *odswiez;
    GtkWidget *label;
    GtkWidget *zapisz;

    window = gtk_application_window_new ( app );
    gtk_window_set_title ( GTK_WINDOW ( window ), "Mandelbrot set" );
    gtk_window_set_default_size ( GTK_WINDOW ( window ), 600, 350 );
    h_box = gtk_box_new ( GTK_ORIENTATION_HORIZONTAL, 20 );
    gtk_container_add ( GTK_CONTAINER ( window ), h_box );

    image = gtk_image_new();
    gtk_image_set_from_file (GTK_IMAGE(image),"tlo.jpg");
    gtk_box_pack_start(GTK_BOX (h_box), image, FALSE, FALSE, 5);

    v_box = gtk_box_new ( GTK_ORIENTATION_VERTICAL, 0 );
    gtk_box_pack_start ( GTK_BOX ( h_box ), v_box, FALSE, FALSE, 0 );

    grid = gtk_grid_new();
    gtk_box_pack_start ( GTK_BOX ( v_box ), grid, FALSE, FALSE, 5 );

    label = gtk_label_new ( "" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 0, 0, 6, 5 );

    label = gtk_label_new ( "lewo" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 5, 6, 1, 1 );
    lewo = gtk_entry_new();
    gtk_grid_attach ( GTK_GRID ( grid ), lewo, 6, 6, 5, 2 );

    label = gtk_label_new ( "prawo" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 5, 8, 1, 1 );
    prawo = gtk_entry_new();
    gtk_grid_attach ( GTK_GRID ( grid ), prawo, 6, 8, 5, 2 );

    label = gtk_label_new ( "gora" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 5, 10, 1, 1 );
    gora = gtk_entry_new();
    gtk_grid_attach ( GTK_GRID ( grid ), gora, 6, 10, 5, 2 );

    label = gtk_label_new ( "dol" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 5, 12, 1, 1 );
    dol = gtk_entry_new();
    gtk_grid_attach ( GTK_GRID ( grid ), dol, 6, 12, 5, 2 );

    label = gtk_label_new ( "" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 0, 14, 6, 2);
    label = gtk_label_new ( "" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 0, 16, 6, 2);
    label = gtk_label_new ( "" );
    gtk_grid_attach ( GTK_GRID ( grid ), label, 0, 18, 6, 2);

    odswiez = gtk_button_new_with_label ( "Odśwież" );
    gtk_grid_attach ( GTK_GRID ( grid ), odswiez, 5, 20, 6, 3 );
    g_signal_connect (odswiez, "clicked", G_CALLBACK(oblicz), NULL);

    zapisz = gtk_button_new_with_label ( "Zapisz" );
    gtk_grid_attach ( GTK_GRID ( grid ), zapisz, 5, 23, 6, 3 );
    gtk_widget_show_all ( window );
}

int main ( int    argc, char **argv )
{
    GtkApplication *app;
    int status;
    app = gtk_application_new ( "Mandelbrot.set", G_APPLICATION_FLAGS_NONE );
    g_signal_connect ( app, "activate", G_CALLBACK ( activate ), NULL );
    status = g_application_run ( G_APPLICATION ( app ), argc, argv );
    g_object_unref ( app );
    return status;
}
