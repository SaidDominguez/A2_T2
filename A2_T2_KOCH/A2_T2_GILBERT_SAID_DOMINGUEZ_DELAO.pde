int totalFrames = 180; // Total de frames para la animación
int frameCount = 0; // Contador de frames
color[] lineColors; // Arreglo para almacenar los colores de las líneas

void setup() {
  size(800, 800);
  lineColors = new color[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    lineColors[i] = color(random(255), random(255), random(255));
  }
  frameRate(10); // Reducimos la velocidad de la animación a 10 cuadros por segundo
  noFill(); // Sin rellenar
  background(0); // Fondo negro
}

void draw() {
  PVector p1 = new PVector(50, 300);
  PVector p2 = new PVector(750, 300);

  float t = map(frameCount, 0, totalFrames, 0, 1);
  float nivel = int(map(sin(t * TWO_PI), -1, 1, 0, 5));

  stroke(lineColors[frameCount]);
  drawKoch(p1, p2, nivel);

  frameCount++;
  if (frameCount >= totalFrames) {
    noLoop();
  }
}

void drawKoch(PVector p1, PVector p2, float nivel) {
  if (nivel == 0) {
    line(p1.x, p1.y, p2.x, p2.y);
  } else {
    PVector[] puntos = new PVector[5];
    for (int i = 0; i < 5; i++) {
      puntos[i] = new PVector(0, 0);
    }

    puntos[0] = p1.copy();
    puntos[4] = p2.copy();
    PVector dir = PVector.sub(p2, p1);
    dir.div(3);
    puntos[1] = PVector.add(p1, dir);
    puntos[3] = PVector.sub(p2, dir);

    PVector v = dir.copy();
    v.rotate(-radians(60));
    puntos[2] = PVector.add(puntos[1], v);

    for (int i = 0; i < 4; i++) {
      drawKoch(puntos[i], puntos[i + 1], nivel - 1);
    }
  }
}
