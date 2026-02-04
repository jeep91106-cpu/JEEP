# 视频压缩脚本 - 优化网络传输
# 使用 H.264 编码和优化参数，减小文件大小同时保持可接受画质

# 创建压缩后的视频目录
$compressedDir = "video-compressed"
New-Item -ItemType Directory -Force -Path $compressedDir | Out-Null
Write-Host "创建输出目录: $compressedDir" -ForegroundColor Green

# 获取所有 MP4 文件
$videoFiles = Get-ChildItem -Path "video" -Filter "*.mp4" | Where-Object { $_.Directory.Name -eq "video" }
$totalFiles = $videoFiles.Count
$currentFile = 0

Write-Host "`n找到 $totalFiles 个视频文件待压缩`n" -ForegroundColor Cyan

foreach ($file in $videoFiles) {
    $currentFile++
    $inputFile = $file.FullName
    $outputFile = Join-Path $compressedDir $file.Name
    
    Write-Host "[$currentFile/$totalFiles] 正在压缩: $($file.Name)" -ForegroundColor Yellow
    Write-Host "  原始大小: $([math]::Round($file.Length/1MB, 2)) MB" -ForegroundColor Gray
    
    # 检查输出文件是否已存在
    if (Test-Path $outputFile) {
        Write-Host "  跳过 - 文件已存在" -ForegroundColor DarkYellow
        continue
    }
    
    # 使用 ffmpeg 压缩视频
    # -crf 28: 恒定质量因子 (18-28范围，数值越大文件越小)
    # -preset medium: 编码速度/质量平衡
    # -vf "scale=-2:720": 降低分辨率至720p
    # -c:a aac -b:a 128k: 音频编码为AAC，比特率128k
    # -movflags +faststart: 优化网络流式传输
    
    $ffmpegArgs = @(
        "-i", "`"$inputFile`""
        "-c:v", "libx264"
        "-crf", "28"
        "-preset", "medium"
        "-vf", "scale=-2:720"
        "-c:a", "aac"
        "-b:a", "128k"
        "-movflags", "+faststart"
        "-y"
        "`"$outputFile`""
    )
    
    $process = Start-Process -FilePath "ffmpeg" -ArgumentList $ffmpegArgs -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputFile)) {
        $compressedSize = (Get-Item $outputFile).Length
        $originalSize = $file.Length
        $reduction = [math]::Round((1 - $compressedSize/$originalSize) * 100, 1)
        
        Write-Host "  压缩完成!" -ForegroundColor Green
        Write-Host "  压缩后大小: $([math]::Round($compressedSize/1MB, 2)) MB" -ForegroundColor Gray
        Write-Host "  压缩率: $reduction%" -ForegroundColor Cyan
    } else {
        Write-Host "  压缩失败!" -ForegroundColor Red
    }
    
    Write-Host ""
}

Write-Host "全部完成！" -ForegroundColor Green
Write-Host "`n压缩后的视频保存在: $compressedDir 目录" -ForegroundColor Cyan
Write-Host "原始视频保留在: video 目录（未修改）" -ForegroundColor Gray
Write-Host "`n下一步：" -ForegroundColor Yellow
Write-Host "1. 测试压缩后的视频质量" -ForegroundColor White
Write-Host "2. 如果满意，更新 index.html 中的路径从 'video/' 改为 'video-compressed/'" -ForegroundColor White
