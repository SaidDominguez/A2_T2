float[][] colors; 
int totalFrames = 180; 
int frameCount = 0; 
float treeLength = 200; 
void setup() {
  size(800, 600);
  colors = new float[totalFrames][3];
  for (int i = 0; i < totalFrames; i++) {
    float n = map(i, 0, totalFrames, 0, 1);
    colors[i][0] = map(noise(n * 5), 0, 1, 0, 255);
    colors[i][1] = map(noise(n * 5 + 100), 0, 1, 0, 255);
    colors[i][2] = map(noise(n * 5 + 200), 0, 1, 0, 255);
  }
  frameRate(30);
}

void draw() {
  background(colors[frameCount][0], colors[frameCount][1], colors[frameCount][2]);

  PVector treeStart = new PVector(width / 2, height);
  stroke(255);
  float t = map(frameCount, 0, totalFrames, 0, 1);
  int depth = int(map(sin(t * TWO_PI), -1, 1, 1, 8));
  drawBranch(treeStart, treeLength, radians(-90), depth);
  
  frameCount++;
  if (frameCount >= totalFrames) {
    noLoop();
  }
}

void drawBranch(PVector start, float len, float angle, int depth) {
  if (depth > 0) {
    PVector end = PVector.add(start, PVector.fromAngle(angle).mult(len));
    
    stroke(255);
    line(start.x, start.y, end.x, end.y);
    
    float newLen = len * 0.7;
    
    float r = map(start.x, 0, width, 0, 255);
    float g = map(start.y, 0, height, 0, 255);
    float b = map(depth, 8, 1, 0, 255);
    stroke(r, g, b);
    
    drawBranch(end, newLen, angle + radians(random(20, 30)), depth - 1);
    drawBranch(end, newLen, angle - radians(random(20, 30)), depth - 1);
  }
}
