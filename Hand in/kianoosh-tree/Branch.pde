class Branch {
  public PVector begin;
  public PVector end;
  public boolean finished = false;
  
  Branch(PVector begin, PVector end){
    this.begin = begin;
    this.end = end;
  }
  void jitter(){
    end.x += random(-1,1);
    end.y += random(-1,1);
  }
  void show(){
    stroke(255);
    line(begin.x,begin.y,end.x,end.y);
  }
    Branch branchA(){
    PVector dir = PVector.sub(end, begin);
    dir.rotate(PI/6);
    dir.mult(0.67);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd);
    return b;
  }
  
  Branch branchB(){
    PVector dir = PVector.sub(end, begin);
    dir.rotate(-PI / 4);
    dir.mult(0.67);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd);
    return b;
  }
  Branch branchC(){
    PVector dir = PVector.sub(end, begin);
    dir.rotate(0);
    dir.mult(0.67);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd);
    return b;
  }
}
