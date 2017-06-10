
float x, y, a, b;

float dx, dy, inicio_x, inicio_y;

float rango_x = 4, centro_x = -.5, centro_y = 0, rango_y;

float lim = 20;

int max_n = 50, p=0;

color col, c1 = 0xff373e51, 
  c2 = 0xff4e5979, 
  c3 = 0xff466253, 
  c4 = 0xfff5c86a, 
  c5 = 0xffce4e35; 

int cant_colores = 4;
int mod = max_n/cant_colores;

void setup() {
  size(800, 500);

  rango_y = rango_x*height/width;

  dx = rango_x/width;
  dy = rango_y/height;

  inicio_x = (centro_x-rango_x/2);
  inicio_y = (centro_y+rango_y/2);

  x = inicio_x;
  y = inicio_y;

  loadPixels();

  for (int i = 0; i<height; i++) {
    for (int j = 0; j<width; j++) {

      a = x;
      b = y;
      int n = 0;

      while (n<max_n) {

        float aa = a*a - b*b;
        float bb = 2*a*b;

        a = aa + x;
        b = bb + y;

        if (dist(a, b, 0, 0)>lim) {
          break;
        }
        n++;
      }

      setColor(n);
      //pixels[p] = color(n*255/max_n,10,150);
      p++;
      x += dx;
    }
    x = inicio_x;
    y -= dy;
  }
  updatePixels();
  
}

void setColor(int n) {

  int num = n%mod;
  if(n == max_n) num=3;
  float inter = (n-(num*mod))/mod;

  switch(num) {
  case 0: 
    pixels[p] = lerpColor(c1, c2, inter);
    break;
  case 1: 
    pixels[p] = lerpColor(c2, c3, inter);
    break;
  case 2: 
    pixels[p] = lerpColor(c3, c4, inter);
    break;
  case 3: 
    pixels[p] = lerpColor(c4, c5, inter);
    break;
  }
}