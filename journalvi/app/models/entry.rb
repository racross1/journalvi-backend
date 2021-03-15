class Entry < ApplicationRecord
  belongs_to :user
  has_many :prompts, dependent: :destroy
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

    all_avgs['POSITIVE'] = avg_pos
    all_avgs['NEGATIVE'] = avg_neg
    all_avgs['NEUTRAL'] = avg_neut
    all_avgs['MIXED'] = avg_mixed

    max = all_avgs.max_by{|k,v| v}
    
    self.update(agg_score: max[1], agg_score_key: max[0])
  end 

end
