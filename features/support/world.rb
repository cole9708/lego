require 'waitutil'

module TestWorld
  def lego
    @app
  end

end

World(TestWorld)

