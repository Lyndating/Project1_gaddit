module PostsHelper
    # A collection method gets a reference to the instance variable
# that represents a collection of objects
def collection
    @posts
  end
  # A method to get a reference to the instance variable that
  # represents a single object
  def resource
    @post
  end
  # An attributes method which returns an array of attributes 
  # to be rendered on the views
  def attributes
     %w(title body)
  end
  # A class method resource to access class definition of elements 
  # in a collection
  def resource_class
    Post
  end
  
end
