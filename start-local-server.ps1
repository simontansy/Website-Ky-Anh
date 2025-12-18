# Script để chạy local server cho website
# Hỗ trợ: Python, Node.js http-server, PHP

Write-Host "=== CHẠY LOCAL SERVER CHO WEBSITE ===" -ForegroundColor Green
Write-Host ""

$port = 8000
$currentDir = Get-Location

Write-Host "Thư mục hiện tại: $currentDir" -ForegroundColor Yellow
Write-Host "Port: $port" -ForegroundColor Yellow
Write-Host ""

# Kiểm tra Python
Write-Host "Đang kiểm tra Python..." -ForegroundColor Cyan
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python đã được cài đặt: $pythonVersion" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "Chạy server bằng Python..." -ForegroundColor Yellow
    Write-Host "Truy cập: http://localhost:$port" -ForegroundColor Green
    Write-Host "Nhấn Ctrl+C để dừng server" -ForegroundColor Yellow
    Write-Host ""
    
    python -m http.server $port
    exit 0
} catch {
    Write-Host "✗ Python chưa được cài đặt" -ForegroundColor Red
}

# Kiểm tra Node.js http-server
Write-Host "Đang kiểm tra Node.js http-server..." -ForegroundColor Cyan
try {
    $httpServer = http-server --version 2>&1
    Write-Host "✓ http-server đã được cài đặt" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "Chạy server bằng http-server..." -ForegroundColor Yellow
    Write-Host "Truy cập: http://localhost:$port" -ForegroundColor Green
    Write-Host "Nhấn Ctrl+C để dừng server" -ForegroundColor Yellow
    Write-Host ""
    
    http-server -p $port
    exit 0
} catch {
    Write-Host "✗ http-server chưa được cài đặt" -ForegroundColor Red
    Write-Host "  Cài đặt: npm install -g http-server" -ForegroundColor Yellow
}

# Kiểm tra PHP
Write-Host "Đang kiểm tra PHP..." -ForegroundColor Cyan
try {
    $phpVersion = php --version 2>&1
    Write-Host "✓ PHP đã được cài đặt" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "Chạy server bằng PHP..." -ForegroundColor Yellow
    Write-Host "Truy cập: http://localhost:$port" -ForegroundColor Green
    Write-Host "Nhấn Ctrl+C để dừng server" -ForegroundColor Yellow
    Write-Host ""
    
    php -S localhost:$port
    exit 0
} catch {
    Write-Host "✗ PHP chưa được cài đặt" -ForegroundColor Red
}

# Không tìm thấy server nào
Write-Host ""
Write-Host "=== KHÔNG TÌM THẤY SERVER NÀO ===" -ForegroundColor Red
Write-Host ""
Write-Host "Vui lòng cài đặt một trong các công cụ sau:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Python (Khuyến nghị):" -ForegroundColor Cyan
Write-Host "   https://www.python.org/downloads/" -ForegroundColor White
Write-Host "   Sau đó chạy: python -m http.server $port" -ForegroundColor White
Write-Host ""
Write-Host "2. Node.js http-server:" -ForegroundColor Cyan
Write-Host "   npm install -g http-server" -ForegroundColor White
Write-Host "   Sau đó chạy: http-server -p $port" -ForegroundColor White
Write-Host ""
Write-Host "3. PHP:" -ForegroundColor Cyan
Write-Host "   https://www.php.net/downloads" -ForegroundColor White
Write-Host "   Sau đó chạy: php -S localhost:$port" -ForegroundColor White
Write-Host ""
Write-Host "4. Hoặc sử dụng Live Server trong VS Code:" -ForegroundColor Cyan
Write-Host "   - Cài extension 'Live Server'" -ForegroundColor White
Write-Host "   - Click phải vào index.html > Open with Live Server" -ForegroundColor White
Write-Host ""

