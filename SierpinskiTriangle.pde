
int sizex, sizey, radio; 
float contador = 0;

int cant_puntos = 3, dado;

PVector[] pos = new PVector[cant_puntos];

PVector ultimo;

void setup()
{
  size(600, 600);
  background(0,0,100);
  
  sizex = width;
  
  radio = sizex/2-20;
  
  ultimo = new PVector(random(sizex), random(sizex));
  
  float w = TWO_PI/cant_puntos;
  
  fill(255);
  
  for (int i = 0; i<cant_puntos; i++) {
    pos[i] = new PVector (int(sizex/2-radio*cos(w*i+PI/2)), 
    int(sizex/2+30-radio*sin(w*i+PI/2)));
    //ellipse(pos[i].x, pos[i].y, 5, 5);
  }
  noStroke();
  fill(255,0,100);
  
}

void draw()
{
  if(contador<1000000)
  {
  ellipse(ultimo.x, ultimo.y, 2, 2);
  dado = int(random(cant_puntos));
  PVector delta = PVector.sub(pos[dado], ultimo);
  delta.div(2);
  ultimo.add(delta);
  }
  else {
    println("Listo"); 
    noLoop();
  }
  contador=+1;
}