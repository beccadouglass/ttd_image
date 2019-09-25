#class Image
 # attr_accessor :data

  #def initialize(data)
  #  @data = data
  #end

  #def begin

  #  return Image.new(@data)
  #end
#end
  
class Image
  attr_accessor :pixels
  
  def initialize(pixels)
    @pixels = pixels
  end
  
  def output_image
    @pixels.each do |subarray|
      puts subarray.join(" ")
    end
  end

  def blur (num)
    locations = []
    num.times do
      @pixels.each_with_index do |row, y|
        row.each_with_index do |number, x|
          if number == 1
            locations << [x,y] 
          end
       end
      end
      locations.each do |location|
        x = location[0]
        y = location[1]
        @pixels[y + 1][x] = 1 unless y == @pixels.length-1
        @pixels[y - 1][x] = 1 unless y == 0
        @pixels[y][x + 1] = 1 unless x == @pixels[y].length-1
        @pixels[y][x - 1] = 1 unless x == 0
      end
    end
  end
end

  

image = Image.new([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
])
#image.output_image
image.blur(1)
puts
image.output_image

#return Image.new(@pixels)
