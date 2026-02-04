# 王嘉平 - AI 專業簡歷

歡迎來到我的個人簡歷項目！這是一個現代極簡風格的網頁簡歷，借鑒了 [Tobias van Schneider](https://vanschneider.com/) 的設計美學。

## 📁 項目結構

```
E:\JEEP\
├── index.html              # 簡歷主頁
├── styles.css              # 樣式文件
├── README.md              # 本文件
├── video\                  # 視頻文件夾
│   └── demo.mp4           # 放置您的視頻文件（MP4 格式）
├── xinde\                  # 工作心得文件夾
│   ├── ai-fenjing-baogao.html    # AI 分鏡腳本分析報告
│   ├── article2.html              # 心得文章 2（待創建）
│   └── article3.html              # 心得文章 3（待創建）
└── xiangmu\                # 項目案例文件夾
    ├── project1.html      # 項目案例 1（待創建）
    ├── project2.html      # 項目案例 2（待創建）
    ├── project3.html      # 項目案例 3（待創建）
    └── images\            # 項目圖片
```

## 🚀 快速開始

### 查看簡歷

1. **直接打開**：雙擊 `index.html` 文件
2. **本地服務器（推薦）**：
   ```bash
   cd E:\JEEP
   python -m http.server 8000
   ```
   然後訪問 `http://localhost:8000`

### 添加視頻

1. 將您的視頻文件放入 `video\` 文件夾
2. 建議文件名：`demo.mp4`
3. 支持格式：MP4（H.264 編碼）、WebM

如果文件名不同，請修改 `index.html` 第 332 行：
```html
<source src="video/您的文件名.mp4" type="video/mp4">
```

### 添加工作心得

1. 在 `xinde\` 文件夾創建新的 HTML 文件（如 `article2.html`）
2. 在 `index.html` 中添加對應的文章卡片（參考第 277-311 行）
3. 或者鏈接到外部文章（知乎、公眾號等）

**已有文章**：
- ✅ `ai-fenjing-baogao.html` - AI 分鏡腳本效能分析報告

### 添加項目案例

1. 在 `xiangmu\` 文件夾創建項目詳情頁（如 `project1.html`）
2. 項目卡片已在主頁顯示（第 220-288 行）
3. 可以添加項目圖片到 `xiangmu\images\`

## 🎨 自定義配置

### 修改配色

編輯 `styles.css` 第 14-23 行：

```css
:root {
    --bg-primary: #0a0a0a;        /* 主背景色 */
    --accent-blue: #3b82f6;       /* 強調色 */
    --accent-green: #10b981;      /* 輔助色 */
}
```

### 更新個人信息

編輯 `index.html`：
- 姓名和標題：第 17-27 行
- 聯繫方式：第 397-401 行

## ✨ 功能特色

### 已實現

- ✅ 深色主題設計
- ✅ 完全響應式佈局
- ✅ 本地視頻播放器
- ✅ 工作心得展示區
- ✅ 項目案例展示區
- ✅ 平滑滾動動畫
- ✅ 技能可視化
- ✅ 職業時間線

### 內容管理

- **工作心得**：已添加 1 篇（AI 分鏡報告），需要添加 2 篇
- **項目案例**：3 個項目卡片已設置，需要創建詳情頁
- **視頻展示**：播放器已就緒，需要放入視頻文件

## 📝 待完成事項

### 高優先級
1. ⚠️ 將視頻文件放入 `video\` 文件夾
2. ⚠️ 創建項目詳情頁（project1.html, project2.html, project3.html）
3. ⚠️ 創建剩餘的工作心得文章（article2.html, article3.html）

### 中優先級
4. 更新聯繫方式（郵箱、GitHub、LinkedIn）
5. 添加項目截圖到 `xiangmu\images\`
6. 根據實際情況調整職業經歷內容

### 低優先級
7. 調整配色方案（如果需要）
8. 添加更多技能標籤
9. 優化 SEO 元標籤

## 🎯 文件說明

| 文件 | 狀態 | 說明 |
|------|------|------|
| `index.html` | ✅ 完成 | 簡歷主頁，包含所有區塊 |
| `styles.css` | ✅ 完成 | 完整樣式，包含新增區塊樣式 |
| `xinde/ai-fenjing-baogao.html` | ✅ 完成 | AI 分鏡腳本分析報告 |
| `xinde/article2.html` | ⚠️ 待創建 | 工作心得文章 2 |
| `xinde/article3.html` | ⚠️ 待創建 | 工作心得文章 3 |
| `xiangmu/project1.html` | ⚠️ 待創建 | AI 動漫分鏡項目詳情 |
| `xiangmu/project2.html` | ⚠️ 待創建 | 金融平台項目詳情 |
| `xiangmu/project3.html` | ⚠️ 待創建 | GIS 工具項目詳情 |
| `video/demo.mp4` | ⚠️ 待添加 | 作品展示視頻 |

## 💡 使用建議

1. **定期更新**：每完成一個項目或寫一篇心得，及時更新到簡歷中
2. **視頻優化**：建議視頻時長 1-3 分鐘，大小控制在 50MB 以內
3. **圖片優化**：項目圖片建議使用 WebP 格式，提升加載速度
4. **內容精煉**：每個項目/文章的描述控制在 2-3 行內

## 🌐 部署方案

### GitHub Pages（免費）
1. 創建 GitHub 倉庫
2. 上傳所有文件
3. 在倉庫設置中啟用 GitHub Pages
4. 訪問 `https://yourusername.github.io/repository-name`

### Netlify / Vercel（免費）
1. 將文件推送到 Git 倉庫
2. 在 Netlify/Vercel 導入項目
3. 自動部署完成

## 📞 技術支持

如果遇到問題，請檢查：
1. 文件路徑是否正確（相對路徑）
2. 視頻格式是否支持（建議 MP4 H.264）
3. 瀏覽器是否為最新版本

---

**版本**: 2.0  
**創建日期**: 2026-01-23  
**最後更新**: 2026-01-23  
**設計風格**: 借鑒 Tobias van Schneider  
**技術棧**: HTML5 + CSS3 + Vanilla JavaScript
