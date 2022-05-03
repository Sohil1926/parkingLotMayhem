class ParkingLot {
  int columnNumber;
  float xColumn;
  float yColumn;
  float size;
  float spacing;
  float laneLength;
  ParkingLot () {
    this.xColumn = (width / float((parkingColumns - 1)));
    this.yColumn = parkingSpotWidth * 4.0;
    this.size = parkingSpots * parkingSpotWidth; 
    this.spacing = (xColumn - (2.0*parkingSpotLength)) / 3.0;
    this.laneLength = 0;
  }
  
  void createLot() {
    stroke(255);
    for (int c = 0; c < parkingColumns; c++) {
      for (int s = 0; s < parkingSpots *  2; s++) {
        filledSpots[c][s] = false;
        if (s < parkingSpots) {
        stroke(255);
       
        locationSpots[c][s] = new PVector((this.xColumn * c) - parkingSpotLength, (parkingSpotWidth * s) + this.yColumn);
        line(locationSpots[c][s].x, locationSpots[c][s].y, locationSpots[c][s].x + parkingSpotLength, locationSpots[c][s].y);
        
          if (c != 0) {
            float laneLength = locationSpots[c][s].x - locationSpots[c - 1][s + parkingSpots].x; //space between parking spots
            float spacing = laneLength/3;
            this.laneLength = laneLength;
          
            stroke(250, 210, 1);
          
            line(locationSpots[c][s].x - spacing, locationSpots[c][s].y, locationSpots[c][s].x - spacing, locationSpots[c][s].y + (parkingSpotWidth/10));
            line(locationSpots[c][s].x - spacing, locationSpots[c][s].y + (parkingSpotWidth/2), locationSpots[c][s].x - spacing, locationSpots[c][s].y + (parkingSpotWidth/10) + (parkingSpotWidth/2));
            line(locationSpots[c][s].x - 2*spacing, locationSpots[c][s].y, locationSpots[c][s].x - 2*spacing, locationSpots[c][s].y + (parkingSpotWidth/10));
            line(locationSpots[c][s].x - 2*spacing, locationSpots[c][s].y + (parkingSpotWidth/2), locationSpots[c][s].x - 2*spacing, locationSpots[c][s].y + (parkingSpotWidth/10) + (parkingSpotWidth/2));
          }
        }
        else {
          stroke(255);
         
          locationSpots[c][s] = new PVector((this.xColumn * c) + parkingSpotLength, (parkingSpotWidth * (s % parkingSpots)) + this.yColumn);
          line(locationSpots[c][s].x, locationSpots[c][s].y, locationSpots[c][s].x - parkingSpotLength, locationSpots[c][s].y);
        }
        
        

      }
    }
    for (int i = 0; i < parkingColumns; i++) {
      line(i * this.xColumn - parkingSpotLength, this.yColumn + this.size, i * this.xColumn + parkingSpotLength, this.yColumn + this.size);
      line(i * this.xColumn, this.yColumn, i * this.xColumn, this.yColumn + this.size);
      }
    
    line(0, this.yColumn/3 , width, this.yColumn/3);
    line(0, 2 * (this.yColumn/3), width, 2 * (this.yColumn/3));
    
    line(0, height - (this.yColumn/3) , width, height - (this.yColumn/3));
    line(0, height - (2 * (this.yColumn/3.0)), width, height - (2 * (this.yColumn/3.0)));
  }
}
