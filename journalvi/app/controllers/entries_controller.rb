class EntriesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]

    def index 
        user = current_user
        user_entries = user.entries
        render json: user_entries
    end 
    
    def create
        entry = Entry.create(user_id: entry_params[:user_id], agg_score:0.0, agg_score_key:'', date: entry_params[:p4]['response'])
        
        prompt1 = Prompt.create(entry_id: entry.id, prompt: entry_params[:p1]['prompt'], response: entry_params[:p1]['response'])        
        prompt2 = Prompt.create(entry_id: entry.id, prompt: entry_params[:p2]['prompt'], response: entry_params[:p2]['response'])        
        prompt3 = Prompt.create(entry_id: entry.id, prompt: entry_params[:p3]['prompt'], response: entry_params[:p3]['response'])        
        
        prompt1.generate_score 
        prompt2.generate_score
        prompt3.generate_score
       
        entry.generate_agg_score
        
        render json: entry
       
    end 

    private

    def entry_params
        params.permit(:user_id, :p1=>{}, :p2=>{}, :p3=>{}, :p4=>{}, :entry=>{})
    end 

end
