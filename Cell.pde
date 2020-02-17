class Cell {
  int x, y, i, j;
  boolean blocked = false;
  int g, h;
  Cell original;
  Cell(int x, int y) {
    this.x=x;
    this.y=y;
    this.i = x/w;
    this.j = y/w;
  }
  void show() {
    if ((targetCell != null && targetCell.equals(this)) || (current != null && (current.equals(this))))
      fill(0, 255, 255);
    else if (closedCells.indexOf(this) != -1)
      fill(255, 0, 0);
    else if (blocked)
      fill(255, 0, 255);
    else if (!(targetCell == null) && openCells.indexOf(this) != -1)
      fill(0, 255, 0);
    else if (path.indexOf(this) != -1)
      fill(255, 255, 0);
    else
      fill(255);
    rect(this.x, this.y, w, w);
  }
  int f() {
    return this.g+this.h;
  }
}
