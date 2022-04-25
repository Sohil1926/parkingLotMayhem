class ParkingColumn {
  int number;
  float xspot;
  float yspot;
  float size;
  ParkingColumn (int n) {
    this.number = n;
    this.xspot = n * (width / (parkingColumns  +1));
    this.yspot = parkingSpots * 4;
    this.size = parkingSpots * parkingSpotSize; 
  }
  
  void createColumn() {
    line(this.xspot, this.yspot, this.xspot, this.yspot + this.size);
  }
}
