#
# Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols).
#
# ```crystal
# require "pangu"
#
# Pangu.spacing("當你凝視著bug，bug也凝視著你")
# => "當你凝視著 bug，bug 也凝視著你"
#
# Pangu.spacing("path/to/file.txt")
# => "與 PM 戰鬥的人，應當小心自己不要成為 PM"
# ```
#
module Pangu
  VERSION = "0.1.0"

  CJK_QUOTE = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])(["\'])/i
  QUOTE_CJK = /(["\'])([\x{3040}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i

  FIX_QUOTE        = /(["\'\(\[\{<\x{201c}]+)(\s*)(.+?)(\s*)(["\'\)\]\}>\x{201d}]+)/i
  FIX_SINGLE_QUOTE = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])( )(\')([A-Za-zΑ-Ωα-ω])/i

  CJK_HASH = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])(#(\S+))/i
  HASH_CJK = /((\S+)#)([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i

  CJK_OPERATOR_ANS = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\+\-\*\/=&\\|<>])([A-Za-zΑ-Ωα-ω0-9])/i
  ANS_OPERATOR_CJK = /([A-Za-zΑ-Ωα-ω0-9])([\+\-\*\/=&\\|<>])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i

  CJK_BRACKET_CJK = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\(\[\{<\x{201c}]+(.*?)[\)\]\}>\x{201d}]+)([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i
  CJK_BRACKET     = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\(\[\{<\x{201c}>])/i
  BRACKET_CJK     = /([\)\]\}>\x{201d}<])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i
  FIX_BRACKET     = /([\(\[\{<\x{201c}]+)(\s*)(.+?)(\s*)([\)\]\}>\x{201d}]+)/i

  FIX_SYMBOL = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([~!;:,\.\?\x{2026}])([A-Za-zΑ-Ωα-ω0-9])/i

  CJK_ANS = /([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([A-Za-zΑ-Ωα-ω0-9`\$%\^&\*\-=\+\\\|\/@\x{00a1}-\x{00ff}\x{2022}\x{2027}\x{2150}-\x{218f}])/i
  ANS_CJK = /([A-Za-zΑ-Ωα-ω0-9`~\$%\^&\*\-=\+\\\|\/!;:,\.\?\x{00a1}-\x{00ff}\x{2022}\x{2026}\x{2027}\x{2150}-\x{218f}])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/i

  def self.spacing_text(text : String)
    text = text.gsub(CJK_QUOTE, "\\1 \\2")
      .gsub(QUOTE_CJK, "\\1 \\2")
      .gsub(FIX_QUOTE, "\\1\\3\\5")
      .gsub(FIX_SINGLE_QUOTE, "\\1\\3\\4")
      .gsub(CJK_HASH, "\\1 \\2")
      .gsub(HASH_CJK, "\\1 \\3")
      .gsub(CJK_OPERATOR_ANS, "\\1 \\2 \\3")
      .gsub(ANS_OPERATOR_CJK, "\\1 \\2 \\3")

    old_text = text
    text = text.gsub(CJK_BRACKET_CJK, "\\1 \\2 \\4")
    if old_text == text
      text = text.gsub(CJK_BRACKET, "\\1 \\2")
        .gsub(BRACKET_CJK, "\\1 \\2")
    end

    text = text.gsub(FIX_BRACKET, "\\1\\3\\5")
      .gsub(FIX_SYMBOL, "\\1\\2 \\3")
      .gsub(CJK_ANS, "\\1 \\2")
      .gsub(ANS_CJK, "\\1 \\2")
    text
  end

  def self.spacing_file(path)
    file = File.open(path, "r")
    data = file.gets_to_end
    file.close
    spacing_text(data)
  end

  def self.spacing(text_or_path)
    if File.file?(text_or_path)
      spacing_file(text_or_path)
    else
      spacing_text(text_or_path)
    end
  end
end
