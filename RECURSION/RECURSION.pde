void setup() {
  size(400, 400);
  noFill();
  stroke(0);
  noLoop();
}
void draw() {
  drawSierpinski(width / 2, height, 200, 5);
}
void drawSierpinski(float x, float y, float len, int depth) {
  if (depth == 0) {
    // Dibuja un triángulo equilátero en la posición dada
    float height = sqrt(3) * len / 2;
    triangle(x, y, x - len / 2, y - height, x + len / 2, y - height);
  } else {
    // Calcula las coordenadas de los tres vértices internos
    float newLen = len / 2;
    float height = sqrt(3) * newLen / 2;
    float x1 = x - newLen / 2;
    float y1 = y - height;
    float x2 = x + newLen / 2;
    float y2 = y - height;
    float x3 = x;
    float y3 = y;

    // Dibuja los tres triángulos más pequeños
    drawSierpinski(x1, y1, newLen, depth - 1);
    drawSierpinski(x2, y2, newLen, depth - 1);
    drawSierpinski(x3, y3, newLen, depth - 1);
  }
}
