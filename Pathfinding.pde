Cell cells[][];
int c, r, w = 20, q = 0;
Cell targetCell, current, startingCell;
ArrayList<Cell> openCells = new ArrayList<Cell>();
ArrayList<Cell> closedCells = new ArrayList<Cell>();
ArrayList<Cell> path = new ArrayList<Cell>();
void setup() {
  size(800, 800);
  c = width/w;
  r = height/w;
  cells = new Cell[c][r];
  int j = 0;
  while (j < r) {
    int i = 0;
    while (i < c) {
      cells[i][j] = new Cell(i*w, j*w);
      i++;
    }
    j++;
  }
  background(0);
}

void draw() {
  background(0);
  int j = 0, i = 0;
  if (targetCell != null && openCells.size() > 0) {
    current = openCells.get(0);
    for (Cell ocell : openCells) {
      if (ocell.f() < current.f() || (ocell.f() == current.f() && ocell.h < current.h))
        current = ocell;
    }
    openCells.remove(current);
    closedCells.add(current);
    ArrayList<Cell> neighbouringCells = new ArrayList<Cell>();
    neighbouringCells = neighbour(current);
    for (Cell neighbouringCell : neighbouringCells) {
      if (!neighbouringCell.blocked && closedCells.indexOf(neighbouringCell) == -1) {
        int newg = current.g+dist(current.i-neighbouringCell.i, current.j-neighbouringCell.j);
        if (newg < neighbouringCell.g || openCells.indexOf(neighbouringCell) == -1) {
          neighbouringCell.g = newg;
          neighbouringCell.h = dist(targetCell.i-neighbouringCell.i, targetCell.j-neighbouringCell.j);
          neighbouringCell.parent = current;
          if (openCells.indexOf(neighbouringCell) == -1)
            openCells.add(neighbouringCell);
        }
      }
    }
    if (current.equals(targetCell)) {
      Cell t = current;
      while (current != startingCell) {
        path.add(current);
        current = current.parent;
      }
      openCells.clear();
      closedCells.clear();
      targetCell = null;
      current = t;
      startingCell = current;
      openCells.add(current);
    }
  }
  i = 0;
  j = 0;
  while (j < r) {
    i = 0;
    while (i < c) {
      cells[i][j].show();
      i++;
    }
    j++;
  }
}
void mousePressed() {
  if (mouseButton == RIGHT) {
    if (q == 0) {
      openCells.add(cells[mouseX/w][mouseY/w]);
      current = openCells.get(0);
      startingCell = current;
    }
    else 
      targetCell = cells[mouseX/w][mouseY/w];
    q++;
  } 
  else {
    Cell clicked = cells[mouseX/w][mouseY/w];
    clicked.blocked = !clicked.blocked;
  }
}

ArrayList<Cell> neighbour(Cell cell) {
  ArrayList<Cell> n = new ArrayList<Cell>();
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      if (i == 0 && j == 0)
        continue;
      if (cell.i+i >= 0 && cell.i+i < c && cell.j+j >= 0 && cell.j+j < r)
        n.add(cells[cell.i+i][cell.j+j]);
    }
  }
  return n;
}

int dist(int dx, int dy) {
  dx = abs(dx);
  dy = abs(dy);
  if (dx > dy)
    return 14*dy+10*(dx-dy);
  return 14*dx+10*(dy-dx);
}
