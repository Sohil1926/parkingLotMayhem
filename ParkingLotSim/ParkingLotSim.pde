
int width = 800;
int height = 500;

int parkingSpots = 15;
int parkingColumns = 5;
float parkingSpotWidth = 500 / float(parkingSpots + 8);
float parkingSpotLength = 2 * parkingSpotWidth;
float carWidth = parkingSpotWidth * 0.8;
float carLength = 2 * carWidth;
float carSpeed = 2;
float tanSlope = 0;

boolean[][] filledSpots = new boolean[parkingColumns][2 * parkingSpots];
PVector[][] locationSpots = new PVector[parkingColumns][parkingSpots * 2];


ParkingLot Lot = new ParkingLot();
Car Car = new Car();

void setup() {
  Lot.createLot();
  size(800, 500);
  background(0);
  Car.createCar();
}

void draw() {
 frameRate(60);
 clear();
 Lot.createLot();
 
  //if (Car.parkRight) {
  //  for (int g = 0; g < parkingColumns-2; g++) {
  //    for (int h = 0; h < parkingSpots; h++) {
  //      if (Car.x > g * Lot.xColumn && Car.x < (g+1) * Lot.xColumn && Car.y)
  //    }
  //  }
  //}
  
  //moving from ENTER
  if (Car.x == width - parkingSpotLength - Lot.spacing - (0.5*carWidth) && Car.y <= height && Car.y >= height - Lot.yColumn) {
    Car.moveStraightVertical(-1);
  }
  
  //last turn up
  else if (Car.x >= ((parkingColumns - 2)*Lot.xColumn) + parkingSpotLength && Car.x <= ((parkingColumns - 2)*Lot.xColumn) + (Lot.spacing * 3) + parkingSpotLength && Car.y <= height && Car.y >= height - Lot.yColumn) {
    Car.turn(2*Lot.spacing - (carWidth/2), ((Lot.yColumn * (2.0/3)) - (carWidth/2)) + 15, (Lot.xColumn * (parkingColumns - 2)) + parkingSpotLength, height - Lot.yColumn - 15, 1, 1, -1);
  }
  
  
  //move up on right lane
  for (int i = 1; i <= parkingColumns - 1; i++) {
    if (absVal(Car.x - ((i*Lot.xColumn) - parkingSpotLength - Lot.spacing - (0.5*carWidth))) < 10  && Car.y >= Lot.yColumn && Car.y <= height - Lot.yColumn) {
       Car.x = (i*Lot.xColumn) - parkingSpotLength - Lot.spacing - (0.5*carWidth);
       for (int p = 0; p < parkingSpots; p++) {
         if (absVal(Car.y - locationSpots[0][p].y) < 3) {
           //println(p);
           Car.parkRight = true;
         }
         else {
           Car.parkRight = false;
         }
       }
       Car.moveStraightVertical(-1);
       Car.changeRandomRigged5();
    }
  }
  
  
  //moving down on left lane
  for (int l = 0; l < parkingColumns - 1; l++) {
    if (absVal(Car.x - ((l * Lot.xColumn) + parkingSpotLength + Lot.spacing + (carWidth/2))) < 5 && Car.y >= Lot.yColumn  && Car.y <= height - Lot.yColumn) {
      Car.x = (l * Lot.xColumn) + parkingSpotLength + Lot.spacing + (carWidth/2);
      Car.moveStraightDown();
      Car.changeRandomRigged5();
    }
  }
  
  //first turn left
  if (Car.x <= width - parkingSpotLength - Lot.spacing - (0.5*carWidth) && Car.x >= width - parkingSpotLength - (3.0 * Lot.spacing) && Car.y <= Lot.yColumn && Car.y >= (Lot.yColumn / 3.0) + (0.5*carWidth)) {
    Car.turn(2*Lot.spacing - (carWidth/2), (Lot.yColumn * (2.0/3)) - (carWidth * 0.5), (Lot.xColumn * (parkingColumns - 2)) + parkingSpotLength, Lot.yColumn, 1, -1, 1);
  }
  
  //horizontal movement between turning points above
  for (int j = 1; j <= parkingColumns - 2; j++) {
    if (Car.x <= (j*Lot.xColumn) + parkingSpotLength && Car.x >= (j*Lot.xColumn) - parkingSpotLength && absVal((Lot.yColumn / 3.0) + (0.5*carWidth) - Car.y) < 1) {
      Car.y = (Lot.yColumn / 3.0) + (0.5*carWidth);
      Car.moveStraightHorizontal();
      Car.changeRandom();
    }
  }
  
  //horizontal movement between turning points below
  for (int n = 1; n <= parkingColumns - 2; n++) {
    if (Car.x <= (n*Lot.xColumn) + parkingSpotLength && Car.x >= (n*Lot.xColumn) - parkingSpotLength && absVal(height - ((Lot.yColumn / 3.0) + (0.5*carWidth)) - Car.y) < 20) {
      Car.y = height - ((Lot.yColumn / 3.0) + (0.5*carWidth));
      Car.moveStraightHorizontalRight();
      Car.changeRandom();
    }
  }
  
  
  //turn down or move forward at intersections
  for (int k = 1; k <= parkingColumns - 2; k++) {
    if (Car.x <= (k*Lot.xColumn) - parkingSpotLength && Car.x >= (k*Lot.xColumn) - parkingSpotLength - (Lot.spacing * 3) && Car.y >= 0 && Car.y <= Lot.yColumn) {
      if (Car.random == 5) {
        Car.turn(2*Lot.spacing - (carWidth/2), (Lot.yColumn * (2.0/3)) - (carWidth * 0.5), (Lot.xColumn * k) - parkingSpotLength - (3 * Lot.spacing), Lot.yColumn, 1, -1, 1);
      }
      else if (Car.random == 1 || k == 1) {
        Car.turn(2*Lot.spacing - (carWidth/2), ((Lot.yColumn * (2.0/3)) - (carWidth/2)) + 20, (Lot.xColumn * k) - parkingSpotLength, Lot.yColumn + 20, -1, -1, 1);
      }
      else {
        Car.moveStraightHorizontal();
      }
    }
  }
  
  //turn up or move forward at intersections
  for (int o = 0; o <= parkingColumns - 3; o++) {
    if (Car.x >= (o*Lot.xColumn) + parkingSpotLength && Car.x <= (o*Lot.xColumn) + (Lot.spacing * 3) + parkingSpotLength && Car.y <= height && Car.y >= height - Lot.yColumn) {
      if (Car.random == 5) {
        Car.turn((2*Lot.spacing - (carWidth/2)) + 5, ((Lot.yColumn * (2.0/3)) - (carWidth/2)), (Lot.xColumn * o) + parkingSpotLength + (3*Lot.spacing) , height - Lot.yColumn , -1, 1, -1);
      }
      else if (Car.random == 1) {
        Car.turn(2*Lot.spacing - (carWidth/2), ((Lot.yColumn * (2.0/3)) - (carWidth/2)) + 15, (Lot.xColumn * o) + parkingSpotLength, height - Lot.yColumn - 15, 1, 1, -1);
      }
      else {
        Car.moveStraightHorizontalRight();
      }
    }
  }
  

  
  
  
  
  //println(absVal(Car.x - ((Lot.xColumn) + parkingSpotLength + Lot.spacing + (carWidth/2))));
  //if (Car.parkRight) {
  //  println(Car.parkRight);
  //}
  

}

