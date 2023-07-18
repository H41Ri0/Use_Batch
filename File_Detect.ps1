
$Folder = (Convert-Path .) + "\" + "新しいフォルダー"  # ←←←←←←←←←← カレントに変更しました
if ( (Test-Path -LiteralPath $Folder) -eq $True  ){  # フォルダがあるか調べる
     $Files = @(Get-ChildItem -LiteralPath $Folder -Recurse -Force | Where-Object {-not $_.PSIsContainer} | ForEach-Object {$_.FullName})  # フォルダ内のファイル名を取得（複数可）
     foreach ($File in $Files){  # ループ
          $Header = @(Get-Content -LiteralPath $File -First 10 -Encoding Byte | ForEach-Object { [char]$_ })  # ファイルの先頭10バイトを取得後、アスキーコードから文字を作成
          $Header = $Header -join ''  # 文字を繋げて文字列にする
          if ( $Header -match '^PK'    ){ Rename-Item -LiteralPath $File -newName $($File+".zip") }  # 正規表現を使用して 文字列の^先頭にPK   があれば、拡張子zipとしてリネームする
          if ( $Header -match '^%PDF-' ){ Rename-Item -LiteralPath $File -newName $($File+".pdf") }  # 正規表現を使用して 文字列の^先頭に%PDF-があれば、拡張子pdfとしてリネームする
         }
    }else{ Write-host '新しいフォルダーがありません' }
exit

# カレントに変更しました。

# 本プログラムは、フォルダーにファイル（拡張子なし）が存在する事を前提に作成しております。
# 指定したフォルダ以外の場所を、変更しないように制限をかけています。ご了承ください。
# 変更は自由にできます。

# 解説を書いております。お手数ですが分からない命令文はWeb検索をご利用ください。

# お返事ありがとうございました。