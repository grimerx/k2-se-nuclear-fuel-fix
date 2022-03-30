-- Find probability of tritium
tritium_probability = 0.0
for _,v in pairs(data.raw.recipe["nuclear-fuel-reprocessing"].results) do
  if v.name == "tritium" then
	tritium_probability = v.probability
  	break
  end
end

-- Guarentee a 50% probability at least of getting a plutonium.  Greater probability if tritium is less frequent.
plutonium_probability = math.max( 1.0 - tritium_probability, 0.5)
recipe_line = { type="item", name="plutonium", probability=plutonium_probability, amount = 1}
table.insert( data.raw.recipe["nuclear-fuel-reprocessing"].results,  recipe_line)