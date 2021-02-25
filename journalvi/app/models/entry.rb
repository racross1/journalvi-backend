class Entry < ApplicationRecord
  belongs_to :user
  has_many :prompts
  has_many :scores, through: :prompts

  def generate_agg_score
    pos_scores = []
    neg_scores = []
    neut_scores = []
    mixed_scores = []

    all_avgs = {}

    entry_scores = self.scores

    entry_scores.each do |s|
      pos_scores << s.pos_score
      neg_scores << s.neg_score
      neut_scores << s.neut_score
      mixed_scores << s.mixed_score
    end
    
    avg_pos = pos_scores.reduce(:+) / pos_scores.length
    avg_neg = neg_scores.reduce(:+) / neg_scores.length
    avg_neut = neut_scores.reduce(:+) / neut_scores.length
    avg_mixed = mixed_scores.reduce(:+) / mixed_scores.length

    all_avgs['pos'] = avg_pos
    all_avgs['neg'] = avg_neg
    all_avgs['neut'] = avg_neut
    all_avgs['mixed'] = avg_mixed

    byebug
    all_avgs.max_by{|k,v| v}

  end 
end
