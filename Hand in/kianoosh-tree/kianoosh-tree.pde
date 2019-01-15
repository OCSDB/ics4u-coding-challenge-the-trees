ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();
ArrayList<Float> leafrot = new ArrayList<Float>();

int count = 0;

void setup(){
  size(800,800);
  //create root-Branch
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height - 250);
  Branch root = new Branch(a, b); 
  ellipseMode(CENTER);
  tree.add(root);
}
void mousePressed(){
  for(int i = tree.size() -1; i >= 0; i--){
    Branch current = tree.get(i);
    if(!current.finished){
      tree.add(current.branchA());
      tree.add(current.branchB());
      //tree.add(current.branchC());
    }
    current.finished = true;
  }
  count ++;
  if(count == 6){
    for(int i = 0; i < tree.size(); i++){
      Branch current = tree.get(i);
      //if the current Branch is on the last Level
      if(!current.finished){
        PVector leaf = current.end.copy();
        leaves.add(leaf);
        float leafr = 0.0;
        leafrot.add(leafr);
      }
    }
  }
}
void draw(){
  background(51);
  for(int i = 0; i < tree.size(); i++){
    tree.get(i).show();
  }
  //forEach Leave: draw it
  for(int i = 0; i < leaves.size(); i++){
    fill(255, 0, 100, 100);
    noStroke();
    PVector leave = leaves.get(i);
    Float rotAmt = leafrot.get(i);
    pushMatrix();
    translate(leave.x,leave.y);
    rotate(rotAmt);
    ellipse(0, 0, 15, 30);
    popMatrix();
    //let the Leave fall
    leafrot.set(i,leafrot.get(i)+radians(random(0,10)));
    leave.y += random(0, 2);
  }
}
