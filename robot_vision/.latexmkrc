

#!/usr/bin/env perl

# ─── PDF モード＋LuaLaTeX 指定 ───
$pdf_mode         = 1;
$pdflatex         = 'lualatex -synctex=1 -interaction=nonstopmode %O %S';

# ─── 繰り返しコンパイル回数と自動監視 ───
$max_repeat       = 5;
$continuous_mode  = 1;

# ─── 文献処理：BibTeX と Biber の両方を利用 ───
$bibtex           = 'bibtex %O %S';
$biber            = 'biber --bblencoding=utf8 --output_safechars %O %S';

# ─── 目次・索引生成 ───
$makeindex        = 'mendex %O -o %D %S';

# ─── プレビューコマンド設定 ───
$pvc_view_file_via_temporary = 0;
if ($^O eq 'darwin') {
    $pdf_previewer = "open %S";
} elsif ($^O eq 'linux') {
    $pdf_previewer = "xdg-open %S";
} else {
    $pdf_previewer = "start %S";
}

# ─── クリーンアップ設定 ───
@default_files = qw(
    *.aux *.bbl *.blg *.idx *.ilg *.ind
    *.fdb_latexmk *.fls *.log *.out *.toc
    *.synctex.gz
);
# PDF を残して不要ファイルを削除
$clean_ext = join ' ', grep { $_ ne 'pdf' } @default_files;