class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post  '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks.build(params[:landmark]) unless (params[:landmark][:name]).empty?
    @figure.titles.build(params[:title]) unless (params[:title][:name]).empty?
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])
     @figure.landmarks.build(params[:landmark]) unless (params[:landmark][:name]).empty?
     @figure.titles.build(params[:title]) unless (params[:title][:name]).empty?
     @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
