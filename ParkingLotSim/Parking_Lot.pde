class ParkingLot {
  int columnNumber;
  float xspot;
  float yspot;
  float size;
  ParkingLot () {
    this.xspot = (width / (parkingColumns - 1));
    this.yspot = parkingSpotWidth * 4;
    this.size = parkingSpots * parkingSpotWidth; 
  }
  
  void createLot() {
    stroke(255);
    for (int c = 0; c < parkingColumns; c++) {
      for (int s = 0; s < parkingSpots *  2; s++) {
        if (s < parkingSpots) {
        locationSpots[c][s] = new PVector((this.xspot * c) - parkingSpotLength, (parkingSpotWidth * s) + this.yspot);
        line(locationSpots[c][s].x, locationSpots[c][s].y, locationSpots[c][s].x + parkingSpotLength, locationSpots[c][s].y);
        }
        else {
          locationSpots[c][s] = new PVector((this.xspot * c) + parkingSpotLength, (parkingSpotWidth * (s % parkingSpots)) + this.yspot);
          line(locationSpots[c][s].x, locationSpots[c][s].y, locationSpots[c][s].x - parkingSpotLength, locationSpots[c][s].y);
        }

      }
    }
    for (int i = 0; i < parkingColumns; i++) {
      line(i * this.xspot - parkingSpotLength, this.yspot + this.size, i * this.xspot + parkingSpotLength, this.yspot + this.size);
      line(i * this.xspot, this.yspot, i * this.xspot, this.yspot + this.size);
      }
  }
}
