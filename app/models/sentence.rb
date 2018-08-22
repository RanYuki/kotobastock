class Sentence < ApplicationRecord
  belongs_to :term
	has_one :source
  has_many :authors, through: :sources
  # Sentenceのフォームで一括登録・更新・削除
  accepts_nested_attributes_for :source, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true
	has_many :concepts, through: :concept_sentences
	has_many :concept_sentences, dependent: :destroy
	has_many :folders, through: :folder_sentences
	has_many :folder_sentences, dependent: :destroy
	has_many :favorites
	has_many :users, through: :favorites

	# タグ機能 acts_as_taggable_on :tagsのエイリアス
  acts_as_taggable
  # sentence.concept_listなどを使用可能に
  acts_as_taggable_on :concepts
	def save_concepts(tags)
    current_tags = self.concepts.pluck(:name) unless self.concepts.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.concepts.delete Concept.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      sentence_concept = Concept.find_or_create_by(name:new_name)
      self.concepts << sentence_concept
    end
  end


  scope :from_concept, -> (concept_id)  { where(id: sentence_ids = ConceptSentence.where(concept_id: concept_id).select(:sentence_id))}
end
