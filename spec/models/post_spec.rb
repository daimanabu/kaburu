require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@post).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'imageが空では保存できないこと' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end

      it "titleが空では登録できないこと" do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルを入力してください")
      end
      it "catch_copyが空では登録できないこと" do
        @post.catch_copy = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("キャッチコピーを入力してください")
      end
      it "conceptが空では登録できないこと" do
        @post.concept = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("コンセプトを入力してください")
      end

    end
  end
end