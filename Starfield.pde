Particle [] b = new Particle [1100];

void setup() {
  size (400, 400);
  noStroke();
  for (int i = 0; i < b.length; i++)
    b[i] = new Particle();
  b[0] = new OddballParticle();
}

void draw() {
  background(0);
  for (int i = 0; i < b.length; i++) {
    b[i].show();
    b[i].out();
  }
}

class Particle {
  double myX, myY, myAngle, mySpeed;
  
  Particle () {
    myAngle = (int)(Math.random()*100) * PI/50;
    myX = mouseX;
    myY = mouseY;
    mySpeed = Math.random()*300;
  }
  
  void show() {
    fill(color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)));
    ellipse((float)myX, (float)myY, (int)(Math.random()*10) + 5, (int)(Math.random()*10) + 5);
  }
  
  void out() {
    myX = myX + (Math.cos(myAngle) * mySpeed);
    myY = myY + (Math.sin(myAngle) * mySpeed); 
  }
  
  void reset() {
  myX = mouseX;
  myY = mouseY;
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    myAngle = (int)(Math.random()*100) * PI/50;
    myX = mouseX;
    myY = mouseY;
    mySpeed = Math.random()*300;
  }
  
  void show() {
    fill(color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)));
    ellipse((float)myX, (float)myY, (int)(Math.random()*10) + 50, (int)(Math.random()*10) + 50);
  }
  
  void out() {
    myX = myX + (Math.cos(myAngle));
    myY = myY + (Math.sin(myAngle)); 
  }
  
  //void reset() {
  //}
  
}

void mousePressed() {
  for (int i = 0; i < b.length; i++)
  b[i].reset();
  redraw();
}
