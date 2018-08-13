require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')


House.delete_all()
Student.delete_all()


house1 = House.new(
  {
    'name' => "Gryffindor",
    'logo' => "https://img.etsystatic.com/il/dc33cd/855105215/il_570xN.855105215_cxm9.jpg"
  }
)

house2 = House.new(
  {
    'name' => "Slytherin",
    'logo' => "https://cdn7.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/88362/91127/Harry-Potter-Slytherin-Crest-Official-wall-mounted-cardboard-cutout-buy-now-at-star__31920.1507640497.jpg"
  }
)

house3 = House.new(
  {
    'name' => "Hufflepuff",
    'logo' => "https://cdn7.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/88364/91134/Harry-Potter-Hufflepuff-Crest-Official-wall-mounted-cardboard-cutout-buy-now-at-star__21122.1507640936.jpg"
  }
)

house1.save()
house2.save()
house3.save()

student1 = Student.new(
  {
    'first_name' => "Harry",
    'second_name' => "Potter",
    'house_id' => house1.id,
    'age' => "11"
  }
)

student2 = Student.new(
  {
    'first_name' => "Draco",
    'second_name' => "Malfoy",
    'house_id' => house2.id,
    'age' => "11"
  }
)

student1.save()
student2.save()

# binding.pry
# nil
