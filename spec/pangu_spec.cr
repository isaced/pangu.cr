# https:#github.com/vinta/pangu.js/blob/master/test/shared/test_core.js

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

  # https:#unicode-table.com/en/blocks/latin-1-supplement/
  it "處理 Latin-1 Supplement" do
    Pangu.spacing("中文Ø漢字").should eq "中文 Ø 漢字"
    Pangu.spacing("中文 Ø 漢字").should eq "中文 Ø 漢字"
  end

  # # https:#unicode-table.com/en/blocks/greek-coptic/
  it "處理 Greek and Coptic" do
    Pangu.spacing("中文β漢字").should eq "中文 β 漢字"
    Pangu.spacing("中文 β 漢字").should eq "中文 β 漢字"
    Pangu.spacing("我是α，我是Ω").should eq "我是 α，我是 Ω"
  end

  # https:#unicode-table.com/en/blocks/number-forms/
  it "處理 Number Forms" do
    Pangu.spacing("中文Ⅶ漢字").should eq "中文 Ⅶ 漢字"
    Pangu.spacing("中文 Ⅶ 漢字").should eq "中文 Ⅶ 漢字"
  end

  # https:#unicode-table.com/en/blocks/cjk-radicals-supplement/
  it "處理 CJK Radicals Supplement" do
    Pangu.spacing("abc⻤123").should eq "abc ⻤ 123"
    Pangu.spacing("abc ⻤ 123").should eq "abc ⻤ 123"
  end

  # https:#unicode-table.com/en/blocks/kangxi-radicals/
  it "處理 Kangxi Radicals" do
    Pangu.spacing("abc⾗123").should eq "abc ⾗ 123"
    Pangu.spacing("abc ⾗ 123").should eq "abc ⾗ 123"
  end

  # https:#unicode-table.com/en/blocks/hiragana/
  it "處理 Hiragana" do
    Pangu.spacing("abcあ123").should eq "abc あ 123"
    Pangu.spacing("abc あ 123").should eq "abc あ 123"
  end

  # https:#unicode-table.com/en/blocks/hiragana/
  it "處理 Katakana" do
    Pangu.spacing("abcア123").should eq "abc ア 123"
    Pangu.spacing("abc ア 123").should eq "abc ア 123"
  end

  # https:#unicode-table.com/en/blocks/bopomofo/
  it "處理 Bopomofo" do
    Pangu.spacing("abcㄅ123").should eq "abc ㄅ 123"
    Pangu.spacing("abc ㄅ 123").should eq "abc ㄅ 123"
  end

  # https:#unicode-table.com/en/blocks/enclosed-cjk-letters-and-months/
  it "處理 Enclosed CJK Letters And Months" do
    Pangu.spacing("abc㈱123").should eq "abc ㈱ 123"
    Pangu.spacing("abc ㈱ 123").should eq "abc ㈱ 123"
  end

  # https:#unicode-table.com/en/blocks/cjk-unified-ideographs-extension-a/
  it "處理 CJK Unified Ideographs Extension-A" do
    Pangu.spacing("abc㐂123").should eq "abc 㐂 123"
    Pangu.spacing("abc 㐂 123").should eq "abc 㐂 123"
  end

  # https:#unicode-table.com/en/blocks/cjk-unified-ideographs/
  it "處理 CJK Unified Ideographs" do
    Pangu.spacing("abc丁123").should eq "abc 丁 123"
    Pangu.spacing("abc 丁 123").should eq "abc 丁 123"
  end

  # https:#unicode-table.com/en/blocks/cjk-compatibility-ideographs/
  it "處理 CJK Compatibility Ideographs" do
    Pangu.spacing("abc車123").should eq "abc 車 123"
    Pangu.spacing("abc 車 123").should eq "abc 車 123"
  end

  it "處理 $ 符號" do
    Pangu.spacing("前面$後面").should eq "前面 $ 後面"
    Pangu.spacing("前面 $ 後面").should eq "前面 $ 後面"
    Pangu.spacing("前面$100後面").should eq "前面 $100 後面"
  end

  it "處理 % 符號" do
    Pangu.spacing("前面%後面").should eq "前面 % 後面"
    Pangu.spacing("前面 % 後面").should eq "前面 % 後面"
    Pangu.spacing("前面100%後面").should eq "前面 100% 後面"
    Pangu.spacing("新八的構造成分有95%是眼鏡、3%是水、2%是垃圾").should eq "新八的構造成分有 95% 是眼鏡、3% 是水、2% 是垃圾"
  end

  it "處理 ^ 符號" do
    Pangu.spacing("前面^後面").should eq "前面 ^ 後面"
    Pangu.spacing("前面 ^ 後面").should eq "前面 ^ 後面"
  end

  it "處理 & 符號" do
    Pangu.spacing("前面&後面").should eq "前面 & 後面"
    Pangu.spacing("前面 & 後面").should eq "前面 & 後面"
    Pangu.spacing("Vinta&Mollie").should eq "Vinta&Mollie"
    Pangu.spacing("Vinta&陳上進").should eq "Vinta & 陳上進"
    Pangu.spacing("陳上進&Vinta").should eq "陳上進 & Vinta"
    Pangu.spacing("得到一個A&B的結果").should eq "得到一個 A&B 的結果"
  end

  it "處理 * 符號" do
    Pangu.spacing("前面*後面").should eq "前面 * 後面"
    Pangu.spacing("前面 * 後面").should eq "前面 * 後面"
    Pangu.spacing("前面* 後面").should eq "前面 * 後面"
    Pangu.spacing("前面 *後面").should eq "前面 * 後面"
    Pangu.spacing("Vinta*Mollie").should eq "Vinta*Mollie"
    Pangu.spacing("Vinta*陳上進").should eq "Vinta * 陳上進"
    Pangu.spacing("陳上進*Vinta").should eq "陳上進 * Vinta"
    Pangu.spacing("得到一個A*B的結果").should eq "得到一個 A*B 的結果"
  end

  it "處理 - 符號" do
    Pangu.spacing("前面-後面").should eq "前面 - 後面"
    Pangu.spacing("前面 - 後面").should eq "前面 - 後面"
    Pangu.spacing("Vinta-Mollie").should eq "Vinta-Mollie"
    Pangu.spacing("Vinta-陳上進").should eq "Vinta - 陳上進"
    Pangu.spacing("陳上進-Vinta").should eq "陳上進 - Vinta"
    Pangu.spacing("得到一個A-B的結果").should eq "得到一個 A-B 的結果"
    Pangu.spacing("长者的智慧和复杂的维斯特洛- 文章").should eq "长者的智慧和复杂的维斯特洛 - 文章"

    # TODO
    # Pangu.spacing("陳上進--Vinta").should eq "陳上進 -- Vinta"
  end

  it "處理 = 符號" do
    Pangu.spacing("前面=後面").should eq "前面 = 後面"
    Pangu.spacing("前面 = 後面").should eq "前面 = 後面"
    Pangu.spacing("Vinta=Mollie").should eq "Vinta=Mollie"
    Pangu.spacing("Vinta=陳上進").should eq "Vinta = 陳上進"
    Pangu.spacing("陳上進=Vinta").should eq "陳上進 = Vinta"
    Pangu.spacing("得到一個A=B的結果").should eq "得到一個 A=B 的結果"
  end

  it "處理 + 符號" do
    Pangu.spacing("前面+後面").should eq "前面 + 後面"
    Pangu.spacing("前面 + 後面").should eq "前面 + 後面"
    Pangu.spacing("Vinta+Mollie").should eq "Vinta+Mollie"
    Pangu.spacing("Vinta+陳上進").should eq "Vinta + 陳上進"
    Pangu.spacing("陳上進+Vinta").should eq "陳上進 + Vinta"
    Pangu.spacing("得到一個A+B的結果").should eq "得到一個 A+B 的結果"
    Pangu.spacing("得到一個C++的結果").should eq "得到一個 C++ 的結果"

    # TODO
    # Pangu.spacing("得到一個A+的結果").should eq "得到一個 A+ 的結果"
  end

  it "處理 | 符號" do
    Pangu.spacing("前面|後面").should eq "前面 | 後面"
    Pangu.spacing("前面 | 後面").should eq "前面 | 後面"
    Pangu.spacing("Vinta|Mollie").should eq "Vinta|Mollie"
    Pangu.spacing("Vinta|陳上進").should eq "Vinta | 陳上進"
    Pangu.spacing("陳上進|Vinta").should eq "陳上進 | Vinta"
    Pangu.spacing("得到一個A|B的結果").should eq "得到一個 A|B 的結果"
  end

  it "處理 \\ 符號" do
    Pangu.spacing("前面\\後面").should eq "前面 \\ 後面"
    Pangu.spacing("前面 \\ 後面").should eq "前面 \\ 後面"
  end

  it "處理 / 符號" do
    Pangu.spacing("前面/後面").should eq "前面 / 後面"
    Pangu.spacing("前面 / 後面").should eq "前面 / 後面"
    Pangu.spacing("Vinta/Mollie").should eq "Vinta/Mollie"
    Pangu.spacing("Vinta/陳上進").should eq "Vinta / 陳上進"
    Pangu.spacing("陳上進/Vinta").should eq "陳上進 / Vinta"
    Pangu.spacing("Mollie/陳上進/Vinta").should eq "Mollie / 陳上進 / Vinta"
    Pangu.spacing("得到一個A/B的結果").should eq "得到一個 A/B 的結果"
    # Pangu.spacing("/home/和/root是Linux中的頂級目錄").should eq "/home/ 和 /root 是 Linux 中的頂級目錄"
    # Pangu.spacing("當你用cat和od指令查看/dev/random和/dev/urandom的內容時").should eq "當你用 cat 和 od 指令查看 /dev/random 和 /dev/urandom 的內容時"
  end

  it "處理 < 符號" do
    Pangu.spacing("前面<後面").should eq "前面 < 後面"
    Pangu.spacing("前面 < 後面").should eq "前面 < 後面"
    Pangu.spacing("Vinta<Mollie").should eq "Vinta<Mollie"
    Pangu.spacing("Vinta<陳上進").should eq "Vinta < 陳上進"
    Pangu.spacing("陳上進<Vinta").should eq "陳上進 < Vinta"
    Pangu.spacing("得到一個A<B的結果").should eq "得到一個 A<B 的結果"
  end

  it "處理 > 符號" do
    Pangu.spacing("前面>後面").should eq "前面 > 後面"
    Pangu.spacing("前面 > 後面").should eq "前面 > 後面"
    Pangu.spacing("Vinta>Mollie").should eq "Vinta>Mollie"
    Pangu.spacing("Vinta>陳上進").should eq "Vinta > 陳上進"
    Pangu.spacing("陳上進>Vinta").should eq "陳上進 > Vinta"
    Pangu.spacing("得到一個A>B的結果").should eq "得到一個 A>B 的結果"
  end

  # 只加左空格

  it "處理 @ 符號" do
    # https:#twitter.com/vinta
    # https:#www.weibo.com/vintalines
    Pangu.spacing("請@vinta吃大便").should eq "請 @vinta 吃大便"
    Pangu.spacing("請@陳上進 吃大便").should eq "請 @陳上進 吃大便"
  end

  it "處理 # 符號" do
    Pangu.spacing("前面#後面").should eq "前面 #後面"
    Pangu.spacing("前面C#後面").should eq "前面 C# 後面"
    Pangu.spacing("前面#H2G2後面").should eq "前面 #H2G2 後面"
    Pangu.spacing("前面 #銀河便車指南 後面").should eq "前面 #銀河便車指南 後面"
    Pangu.spacing("前面#銀河便車指南 後面").should eq "前面 #銀河便車指南 後面"
    Pangu.spacing("前面#銀河公車指南 #銀河拖吊車指南 後面").should eq "前面 #銀河公車指南 #銀河拖吊車指南 後面"
  end

  # 只加右空格

  it "處理 ... 符號" do
    Pangu.spacing("前面...後面").should eq "前面... 後面"
    Pangu.spacing("前面..後面").should eq "前面.. 後面"
  end

  # \u2026
  it "處理 … 符號" do
    Pangu.spacing("前面…後面").should eq "前面… 後面"
    Pangu.spacing("前面……後面").should eq "前面…… 後面"
  end
end
