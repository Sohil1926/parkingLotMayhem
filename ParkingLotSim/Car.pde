class Car {
  float x;
  float y;
  color colour;
  int random;
  boolean parkRight;
  Car() {
    this.x = width - parkingSpotLength - Lot.spacing - (0.5*carWidth);
    this.y = height;
    this.colour = color(255, 0, 0);
    this.random = int(random(0, 2));
    this.parkRight = false;
  }
  
  void createCar() {
    fill(this.colour);
    rect(this.x, this.y, carWidth, carLength);
  }
  
  void moveStraightVertical(int negative) {
    this.y += negative * carSpeed; //negative means up
    fill(this.colour);
    rect(this.x, this.y, carWidth, carLength);
  }
  
  void moveStraightDown() {
    pushMatrix();
    translate(this.x, this.y);
    rotate(PI); 
    rect(0, 0, carWidth, carLength);
    popMatrix();
    
    this.y += carSpeed;
  }
  
  void turn(float c, float d, float centerA, float centerB, float upordown, float toporbottom, float rotation) {
    
    
    noFill();
    stroke(255);
    
    //Draw oval line
    ellipseMode(RADIUS);
    ellipse(centerA, centerB, c, d);
    

    
    //Semi Oval function
    this.y = ((toporbottom * d/c) * sqrt(pow(c, 2) - pow((this.x - centerA) - 0.001, 2)) + centerB); //Formula for semi-ellipse
         
    tanSlope = (float(-1) / tangentSlope(c, d, this.x, centerA));
    float rotator = atan(tanSlope);
    
    
    fill(this.colour);
    
    line(this.x, this.y, 100+this.x, 100*tanSlope+this.y);
    
    //negative = 1 up, negative = -1 down
    pushMatrix();
    translate(this.x, this.y);
    rotate(rotation * rotator);
    rect(0, 0, upordown * carWidth, upordown * carLength);
    popMatrix();
    
    this.x += (1.4 - cos(rotator)) * (toporbottom * carSpeed);
  }
  
  void moveStraightHorizontal() {
    
    pushMatrix();
    translate(this.x+carLength, this.y-carWidth);
    rotate(PI/2);
    rect(0, 0, carWidth, carLength);
    popMatrix();
    
    this.x -= carSpeed;
  }
  
  void moveStraightHorizontalRight() {
    
    pushMatrix();
    translate(this.x-carLength, this.y+carWidth);
    rotate(3*PI/2);
    rect(0, 0, carWidth, carLength);
    popMatrix();
    
    this.x += carSpeed;
  }
  
  void changeRandom() {
    this.random = int(random(0,2));
  }
  
  void changeRandomRigged5() {
    this.random = 5;
  }
  
  void changeRandomRigged10() {
    this.random = 10;
  }
  
  
}
