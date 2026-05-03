# features/step_definitions/movie_steps.rb

# PASSOS DE NAVEGAÇÃO E CLIQUES

Given("I am on the Rotten Potatoes home page") do
  visit movies_path
end

Then("I should be on the Rotten Potatoes home page") do
  expect(current_path).to eq(movies_path).or eq(root_path)
end

Then("I should be on the Create New Movie page") do
  expect(current_path).to eq(new_movie_path)
end

When("I follow {string}") do |link|
  click_link link
end

When("I select {string} from {string}") do |option, select_box|
  select option, from: select_box
end

When("I press {string}") do |button|
  click_button button
end


# PASSOS DE FORMULÁRIO E TEXTO

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end


# PASSOS ESPECÍFICOS DA TAREFA (ORDENAÇÃO E TABELA)

Then("I should see {string} before {string}") do |e1, e2|
  # Garante que o índice do primeiro texto é menor que o do segundo
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

Given("the following movies exist:") do |table|
  # Transforma a tabela do Cucumber em dados no banco de dados
  table.hashes.each do |movie|
    Movie.create!(movie)
  end
end