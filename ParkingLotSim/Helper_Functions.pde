float tangentSlope(float m, float n, float o, float c) { //finding slope of tangent based on the oval
  o = o - c;
  if (o > m) {
    o = m - 0.001;
  }
  return ((n*o) / (m * sqrt(pow(m, 2) - (pow(o, 2)))));  
}

float absVal(float m) { //absolute value function
  if (m < 0) {
    m = m * -1;
  }
  return m;
}
