void setup()
{
  size(500, 500);
  ship = new Ship();
  x = width/2;
  y = height/2;
}

float x,y;

//The class name always starts with uppercase!!
Ship ship; //ship is called an INSTANCE of the Ship class
void draw()
{
  background(0);
  stroke(255);

  ship.render();
  ship.update();
  
  /*
  if(x == i && y == j)
  {
    i = random(width);
    j = random(height);
  }
  */
}

