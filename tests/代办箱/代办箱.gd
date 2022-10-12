extends Tree


# Called when the node enters the scene tree for the first time.
func _ready():
  var root = self.create_item()

  root.set_text(0, 'test')

  var child1 = self.create_item(root)

  child1.set_text(0, 'test-1')

  var child2 = self.create_item(root)

  child2.set_text(0, 'test-2')

  var subchild1 = self.create_item(child1)
  subchild1.set_text(0, "test-3")
