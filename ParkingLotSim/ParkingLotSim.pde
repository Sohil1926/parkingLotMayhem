int width = 800;
int height = 500;

int parkingSpots = 10;
int parkingColumns = 4;
float parkingSpotWidth = 500 / (parkingSpots + 8);
float parkingSpotLength = 2 * parkingSpotWidth;
float carSize = parkingSpotWidth * 0.8;

boolean[][] filledSpots = new boolean[parkingColumns][parkingSpots];
PVector[][] locationSpots = new PVector[parkingColumns][parkingSpots * 2];

ParkingLot Lot = new ParkingLot();

void setup() {
  size(800, 500);
  background(0);
}

void draw() {
  Lot.createLot();
}
