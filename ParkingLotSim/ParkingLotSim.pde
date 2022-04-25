int parkingSpots = 10;
int parkingColumns = 3;
float parkingSpotSize = 500 / (parkingSpots + 6);
float carSize = parkingSpotSize * 0.8;



void setup() {
  size(800, 500);
  background(0);
}

void draw() {
  for (int i = 0; i < parkingColumns; i++) {
    ParkingColumn Column1 = new ParkingColumn(1);
    ParkingColumn.createColumn();
  }
}
