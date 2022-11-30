desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

first_name = ["Pat", "Bob", "Beth", "Mike", "Matt"]
last_name = ["Smith", "Erikson", "David", "Xi", "Jane"]
email = ["123@gmail.com", "sample@gmail.com", "345@gmail.com", "email@email.com", "sampleemail@gmail.com"]
phone = ["8057284444", "1231231234", "123456789", "1111111111"]
location = ["MPP", "MILA", "73"]

5.times do |count|
  user = User.new
  user.email = email.at(count)
  user.first_name = first_name.at(count)
  user.last_name = last_name.at(count)
  user.password = "my_password"
  user.phone = phone.sample
  user.location = location.sample
  user.save

end

ingredient_owned = ["cookie", "carrot", "pizza", "salt", "garlic", "onion", "cumin", "peppers", "cilantro", "cake"]
location = ["MPP", "MILA", "73"]
quantity =[1,2,3]
users = User.all

10.times do 
  ingredient = IngredientOwned.new
  ingredient.item = ingredient_owned.sample
  ingredient.location = location.sample
  ingredient.quantity = quantity.sample
  ingredient.user_id = users.sample.id
  ingredient.save
end

end
