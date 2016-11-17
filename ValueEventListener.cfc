component {
  property any data;
  property any lastupdate;

  public function init() { Variables.data="Not Initialized"; return this; }

  public function onDataChange(any dataSnapshot) {
    variables.data = dataSnapshot.getValue();
    variables.lastupdate = now();
  }

  public function getData() { return variables.data; }
  public function getLastUpdate() { return variables.lastUpdate; }
}
