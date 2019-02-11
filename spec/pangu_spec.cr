require "./spec_helper"

describe Pangu do
  it "略過 _ 符號" do
    Pangu.spacing("前面_後面").should eq "前面_後面"
    Pangu.spacing("前面 _ 後面").should eq "前面 _ 後面"
    Pangu.spacing("Vinta_Mollie").should eq "Vinta_Mollie"
    Pangu.spacing("Vinta _ Mollie").should eq "Vinta _ Mollie"
  end

  it "處理 Alphabets" do
    Pangu.spacing("中文abc").should eq "中文 abc"
    Pangu.spacing("中文abc").should eq "中文 abc"
  end

  it "處理 Numbers" do
    Pangu.spacing("中文123").should eq "中文 123"
    Pangu.spacing("123中文").should eq "123 中文"
  end

  # https://unicode-table.com/en/blocks/latin-1-supplement/
  it "處理 Latin-1 Supplement" do
    Pangu.spacing("中文Ø漢字").should eq "中文 Ø 漢字"
    Pangu.spacing("中文 Ø 漢字").should eq "中文 Ø 漢字"
  end

  # // https://unicode-table.com/en/blocks/greek-coptic/
  it "處理 Greek and Coptic" do
    Pangu.spacing("中文β漢字").should eq "中文 β 漢字"
    Pangu.spacing("中文 β 漢字").should eq "中文 β 漢字"
    Pangu.spacing("我是α，我是Ω").should eq "我是 α，我是 Ω"
  end
end
