require 'spec_helper'
require 'liquid-rails/matchers'

describe ProfileDrop, type: :drop do
  include Liquid::Rails::Matchers

  it { should have_attribute(:name) }
  it { should have_attribute(:description) }
  it { should_not have_attribute(:not_found) }
end

describe PostDrop, type: :drop do
  include Liquid::Rails::Matchers

  it { should have_many(:comments) }
  it { should_not have_many(:not_found) }

  it { should have_many(:recomments).class_name('CommentsDrop') }
  it { should have_many(:recomments).with('ReCommentDrop') }
  it { should have_many(:recomments).class_name('CommentsDrop').with('ReCommentDrop') }

  it { should_not have_many(:recomments).class_name('NotFound') }
  it { should_not have_many(:recomments).with('NotFound') }
  it { should_not have_many(:recomments).class_name('NotFound').with('NotFound') }
end

describe CommentDrop, type: :drop do
  include Liquid::Rails::Matchers

  it { should belongs_to(:post) }
  it { should_not belongs_to(:not_found) }

  it { should belongs_to(:repost).class_name('RePostDrop') }
  it { should_not belongs_to(:repost).class_name('NotFound') }
end