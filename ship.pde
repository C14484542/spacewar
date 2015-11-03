class Ship
{
  float x, y;
  float w;
  float halfw;
  float x1, y1, x2, y2, x3, y3;
  float a, b, a1, b1;
  float i, j;
  //Constructor!!
  //HAS NO RETURN TYPE
  //Name is always the same as class

  Ship()
  {
    x = width*0.5f;
    y = height*0.5f;
    w = 50;
    halfw = w/2;
    x1 = x-halfw;
    y1 = y+halfw;
    x2 = x;
    y2 = y-halfw;
    x3 = x + halfw;
    y3 = y + halfw;

    a = 0;
    b = 0;
    a1 = 0;
    b1 = 0;

    i = random(500);
    j = random(500);
  }

  void update()
  {
    if (keyPressed)
    {
      if (key == 'w')
      {
        y -= 5;
        halfw = w/2;
        x1 = x-halfw;
        y1 = y+halfw;
        x2 = x;
        y2 = y-halfw;
        x3 = x + halfw;
        y3 = y + halfw;
        a = x2;
        b = y2 - 5;
        a1 = x2;
        b1 = y2 - 15;
      }

      if (key == 'a')
      {
        x -= 5;
        x1 = x + halfw;
        y1 = y - halfw;
        x2 = x - halfw;
        y2 = y;
        x3 = x + halfw;
        y3 = y + halfw;
        a = x2 - 5;
        b = y2;
        a1 = x2 - 15;
        b1 = y2;
      }

      if (key == 's')
      {
        y+=5;
        x1 = x + halfw;
        y1 = y - halfw;
        x2 = x;
        y2 = y + halfw;
        x3 = x - halfw;
        y3 = y - halfw;
        a = x2;
        b = y2 + 5;
        a1 = x2;
        b1 = y2 + 15;
      }

      if (key == 'd')
      {
        x += 5;
        x1 = x - halfw;
        y1 = y - halfw;
        x2 = x + halfw;
        y2 = y;
        x3 = x - halfw;
        y3 = y + halfw;
        a = x2 + 5;
        b = y2;
        a1 = x2 + 15;
        b1 = y2;
      }
    }
  }


  void render()
  {

    line(x, y, x1, y1);
    line(x1, y1, x2, y2);
    line(x2, y2, x3, y3);
    line(x3, y3, x, y);

    if (key == ' ' && y2 == y-halfw)
    {
      bullet();
      b--;
      b1--;

      if (b < j && a > i && a < i+20)
      {
        i = random(500);
        j = random(500);
      }
    }
    if (key == ' ' && y2 == y+halfw)
    {
      bullet();
      b++;
      b1++;

      if (b > j + 20 && a > i && a < i+20)
      {
        i = random(500);
        j = random(500);
      }
    }
    if (key == ' ' && x2 == x+halfw)
    {
      bullet();
      a++;
      a1++;

      if (b > j && b < j + 20 && a > i + 20)
      {
        i = random(500);
        j = random(500);
      }
    }
    if (key == ' ' && x2 == x-halfw)
    {
      bullet();
      a--;
      a1--;

      if (b > j && b < j + 20 && a < i)
      {
        i = random(500);
        j = random(500);
      }
    }
    
    fill(255,0,255);
    rect(i, j, 20, 20);
    /*
    beginShape();
     vertex(x, y);
     vertex(x-halfw, y+halfw);
     vertex(x, y-halfw);
     vertex(x+halfw, y+halfw);
     endShape();*/
  } 

  void bullet()
  {
    float points = 5;
    float radius, sradius;
    float theta = 0;
    radius = random(1, 10);
    sradius = radius/2.0f;
    float thetaInc = TWO_PI / (points * 2); 
    float sx;
    float sy;
    sx = a;
    sy = b-radius; 

    stroke(random(255), random(255), random(255));

    while (theta < TWO_PI)
    {
      for (int i = 1; i <= (points * 2); i ++)
      {
        theta = i * thetaInc;
        float x, y;
        if (i % 2 == 1)
        {
          x = a + sin(theta) * (sradius);
          y = b + -cos(theta) * (sradius);
        } else
        {
          x = a+ sin(theta) * radius;
          y = b + -cos(theta) * radius;
        }
        line(sx, sy, x, y);
        sx = x;
        sy = y;
      }
    }
  }
}

