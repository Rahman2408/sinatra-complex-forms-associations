class PetsController < ApplicationController

  get '/pets' do
    @owners = Owner.all
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
  
    @pet = Pet.create(name: params["pet"]["name"])
    if !params["owner"].empty? 
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end