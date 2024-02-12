class ColorParticle extends Particle {
  float r,g,b;
  
  ColorParticle() {
    r = (float)Math.random()*256;
    g = (float)Math.random()*256;
    b = (float)Math.random()*256;
    diameter += 5;
  }
  
  void collided () {
    finished = true;
    reverse = width/2 - (x-width/2);

    for (int i = 0; i < numSpokes; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(((2*PI)/numSpokes) * i);
      fill(r,g,b);
      ellipse(x-width/2, y-height/2, diameter, diameter);
      ellipse(reverse-width/2, y-height/2, diameter, diameter);
      popMatrix();
    }
  
     
}
    
  
  }
  
  
