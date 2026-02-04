# 视频缩略图生成脚本
# 为每个视频生成缩略图，用于网页预览

# 创建缩略图目录
$thumbnailDir = "video\thumbnails"
New-Item -ItemType Directory -Force -Path $thumbnailDir | Out-Null
Write-Host "创建缩略图目录: $thumbnailDir" -ForegroundColor Green

# 获取所有 MP4 文件
$videoFiles = Get-ChildItem -Path "video" -Filter "*.mp4" | Where-Object { $_.Directory.Name -eq "video" }
$totalFiles = $videoFiles.Count
$currentFile = 0

Write-Host "`n找到 $totalFiles 个视频文件`n" -ForegroundColor Cyan

foreach ($file in $videoFiles) {
    $currentFile++
    $inputFile = $file.FullName
    $outputFile = Join-Path $thumbnailDir "$($file.BaseName).jpg"
    
    Write-Host "[$currentFile/$totalFiles] 生成缩略图: $($file.Name)" -ForegroundColor Yellow
    
    # 检查输出文件是否已存在
    if (Test-Path $outputFile) {
        Write-Host "  跳过 - 缩略图已存在" -ForegroundColor DarkYellow
        continue
    }
    
    # 使用 ffmpeg 从视频第1秒提取一帧作为缩略图
    # -ss 00:00:01: 定位到第1秒
    # -vframes 1: 只提取1帧
    # -q:v 2: JPEG质量 (2-5 高质量)
    
    $ffmpegArgs = @(
        "-i", "`"$inputFile`""
        "-ss", "00:00:01"
        "-vframes", "1"
        "-q:v", "2"
        "-y"
        "`"$outputFile`""
    )
    
    $process = Start-Process -FilePath "ffmpeg" -ArgumentList $ffmpegArgs -NoNewWindow -Wait -PassThru -RedirectStandardError "NUL"
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputFile)) {
        $thumbSize = (Get-Item $outputFile).Length
        Write-Host "  生成成功! ($([math]::Round($thumbSize/1KB, 1)) KB)" -ForegroundColor Green
    } else {
        Write-Host "  生成失败!" -ForegroundColor Red
    }
}

Write-Host "`n全部完成！" -ForegroundColor Green
Write-Host "缩略图保存在: $thumbnailDir 目录" -ForegroundColor Cyan
Write-Host "`n下一步：" -ForegroundColor Yellow
Write-Host "更新 index.html 中的 video 标签，添加 poster 属性" -ForegroundColor White
Write-Host "例如: poster=`"video/thumbnails/01会议.jpg`"" -ForegroundColor Gray
