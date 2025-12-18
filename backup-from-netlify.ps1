# Script để backup code từ Netlify
# Yêu cầu: Cần có Netlify CLI đã cài đặt và đã đăng nhập

Write-Host "=== BACKUP CODE TỪ NETLIFY ===" -ForegroundColor Green
Write-Host ""

# Kiểm tra Netlify CLI
try {
    $netlifyVersion = netlify --version 2>&1
    Write-Host "✓ Netlify CLI đã được cài đặt: $netlifyVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Netlify CLI chưa được cài đặt!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Để cài đặt Netlify CLI, chạy lệnh sau:" -ForegroundColor Yellow
    Write-Host "npm install -g netlify-cli" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Sau đó đăng nhập:" -ForegroundColor Yellow
    Write-Host "netlify login" -ForegroundColor Cyan
    exit 1
}

# Tạo thư mục backup
$backupDir = "backup-netlify-$(Get-Date -Format 'yyyy-MM-dd-HHmmss')"
Write-Host "Tạo thư mục backup: $backupDir" -ForegroundColor Yellow
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

# Pull code từ Netlify
Write-Host ""
Write-Host "Đang tải code từ Netlify..." -ForegroundColor Yellow
Write-Host "Lưu ý: Bạn cần đã đăng nhập Netlify (netlify login)" -ForegroundColor Cyan
Write-Host ""

# Lấy danh sách sites
Write-Host "Danh sách sites trên Netlify:" -ForegroundColor Yellow
netlify sites:list

Write-Host ""
Write-Host "Để pull code về, chạy lệnh:" -ForegroundColor Yellow
Write-Host "netlify pull" -ForegroundColor Cyan
Write-Host ""
Write-Host "Hoặc clone từ Git repository nếu site được kết nối với Git" -ForegroundColor Yellow
Write-Host ""

# Hướng dẫn thêm
Write-Host "=== HƯỚNG DẪN CHI TIẾT ===" -ForegroundColor Green
Write-Host ""
Write-Host "Cách 1: Sử dụng Netlify CLI" -ForegroundColor Yellow
Write-Host "1. Cài đặt: npm install -g netlify-cli" -ForegroundColor Cyan
Write-Host "2. Đăng nhập: netlify login" -ForegroundColor Cyan
Write-Host "3. Link site: netlify link" -ForegroundColor Cyan
Write-Host "4. Pull code: netlify pull" -ForegroundColor Cyan
Write-Host ""
Write-Host "Cách 2: Tải từ Netlify Dashboard" -ForegroundColor Yellow
Write-Host "1. Vào https://app.netlify.com/" -ForegroundColor Cyan
Write-Host "2. Chọn site: donboscokyanh" -ForegroundColor Cyan
Write-Host "3. Vào Deploys > Chọn deploy muốn tải" -ForegroundColor Cyan
Write-Host "4. Download deploy bundle" -ForegroundColor Cyan
Write-Host ""
Write-Host "Cách 3: Clone từ Git (nếu có)" -ForegroundColor Yellow
Write-Host "1. Vào Netlify Dashboard > Site settings > Build & deploy" -ForegroundColor Cyan
Write-Host "2. Xem Git repository được kết nối" -ForegroundColor Cyan
Write-Host "3. Clone repository về máy" -ForegroundColor Cyan
Write-Host ""

