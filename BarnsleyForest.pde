
int sizex, sizey, n, c, loops = 0;
boolean a;
float contador = 0, m, x;

//color [] col = {color(#D1CEC5), color(#997C67), color(#755330), 
//                color(#B0703C), color(#DBA72E), color(#E3CCA1)};

color [] col = {0xFF6E352C, 0xFFCF5230, 0xFFF59A44, 0xFFE3C598, 0xFF8A6E64, 0xFF6E612F};

float dado;

float [][] matrix = { {0, 0, 0, 0.16, 0, 0, 0.01}, 
  {0.85, 0.04, -0.04, 0.85, 0, 1.60, 0.85}, 
  {0.20, -0.26, 0.23, 0.22, 0, 1.60, 0.07}, 
  {-0.15, 0.28, 0.26, 0.24, 0, 0.44, 0.07} };

//float [][] matrix = { {0,     0,     0,      .2,     0,   -0.12,    .01},
//{ .845,  .035,  -.035,    .82,    0,    1.6,     .85},
//{ .2,   -.31,    .255,    .245,   0,     .29,    .07},
//{-.15,   .24,    .25,     .20,    0,     .68,    .07} };

PVector ultimo;

void setup()
{
  size(800, 400);
  background(5);

  sizex = width;
  sizey = height;
  ultimo = new PVector(0, 0);
  m= random(25, sizey/10);
  x = random(10, sizex-10);
  c = int(random(0, 5));
  if (random(0, 1)<.5)
  {
    a = true;
  } else
  {
    a=false;
  }

  noStroke();
}

void draw()
{
  if (loops<20)
  {
    if (contador<5000)
    {

      fill(col[c]);

      ellipse(ultimo.x*m+x, sizey-ultimo.y*m, 1, 1);

      dado = random(0, 1);

      if (dado < matrix[0][6])
      {
        n = 0;
      } else if (dado<matrix[1][6]+matrix[0][6])
      {
        n = 1;
      } else if (dado<matrix[2][6]+matrix[1][6]+matrix[0][6])
      {
        n = 2;
      } else
      {
        n = 3;
      }

      if (a)
      {

        ultimo.set(matrix[n][0]*ultimo.x+
          matrix[n][1]*ultimo.y, 
          matrix[n][2]*ultimo.x+
          matrix[n][3]*ultimo.y+
          matrix[n][5]);
      } else
      {
        ultimo.set(matrix[n][0]*ultimo.x-
          matrix[n][1]*ultimo.y, 
          -matrix[n][2]*ultimo.x+
          matrix[n][3]*ultimo.y+
          matrix[n][5]);
      }
      contador++;
    } else
    {

      m= random(25, sizey/10);
      c = int(random(0, 5));
      if (random(0, 1)<.5)
      {
        a = true;
      } else
      {
        a=false;
      }
      x = random(10, sizex-10);
      contador = 0;
      loops++;
    }
  }
}