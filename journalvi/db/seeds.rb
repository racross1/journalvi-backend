Score.delete_all
Prompt.delete_all
Entry.delete_all
User.delete_all


# u1 = User.first


# e1 = Entry.create(user_id: u1.id, agg_score: 0.95)
# p1 = Prompt.create(entry_id: e1.id, prompt:'How was your morning?', response: 'it was fantastic!')
# s1 = Score.create(prompt_id: p1.id, sentiment: "POSITIVE", pos_score: 0.999, neg_score: 0.00001, neut_score: 0.005, mixed_score:0.0007)

puts "done"