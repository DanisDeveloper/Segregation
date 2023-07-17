class Agent{
  public int x = 0;
  public int y = 0;
  public int type = 0;
  
  Agent(int _x,int _y,int _type){
    x = _x;
    y = _y;
    type = _type;
  }
  
  void swap(Agent agent){
    Agent temp = new Agent(this.x,this.y,this.type);
    this.type = agent.type;
    this.x = agent.x;
    this.y = agent.y;
    
    agent.type = temp.type;
    agent.x = temp.x;
    agent.y = temp.y;
  }
}
