class Particle {
  float x, y, reverse;
  int diameter;
  boolean finished;
  int numSpokes;
  int drift;
  float r,g,b;

 
  Particle() {
    y = -100;
    x = width/2;
    diameter = 7;
    finished = false;
    drift = 4;
    numSpokes = 5;
  }

  void process() {
    if (!finished) {
      y+=1;
      x+=(Math.random() - 0.5) * drift;
    }
  }

  void collided () {
    finished = true;
    reverse = width/2 - (x-width/2);

    for (int i = 0; i < numSpokes; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(((2*PI)/numSpokes) * i);
      fill(0,0,0);
      ellipse(x-width/2, y-height/2, diameter, diameter);
      ellipse(reverse-width/2, y-height/2, diameter, diameter);
      popMatrix();
    }
  }
}
