// Mobile Menu Toggle
const menuToggle = document.querySelector('.menu-toggle');
const navMenu = document.querySelector('.nav-menu');

if (menuToggle) {
    menuToggle.addEventListener('click', () => {
        navMenu.classList.toggle('active');
        menuToggle.classList.toggle('active');
    });
}

// Smooth Scrolling - Only for anchor links on the same page
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        
        // If href contains .html, it's a link to another page - let browser handle it normally
        if (href.includes('.html')) {
            return; // Don't prevent default, let browser navigate
        }
        
        // Only handle same-page anchor links (starting with # only)
        if (href.startsWith('#') && href.length > 1) {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                // Close mobile menu if open
                if (navMenu.classList.contains('active')) {
                    navMenu.classList.remove('active');
                    menuToggle.classList.remove('active');
                }
            }
        }
    });
});

// Form Submission
const enrollmentForm = document.querySelector('.enrollment-form form');
if (enrollmentForm) {
    enrollmentForm.addEventListener('submit', (e) => {
        e.preventDefault();
        alert('Cảm ơn bạn đã đăng ký! Chúng tôi sẽ liên hệ với bạn sớm nhất có thể.');
        enrollmentForm.reset();
    });
}

// Scroll Animation
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all sections
document.querySelectorAll('section > .container > *').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(el);
});

// Toggle hiển thị accordion khi click vào tiêu đề "Cựu học sinh"
const alumniSectionTitle = document.querySelector('.alumni .section-title');
const alumniAccordion = document.querySelector('.alumni-accordion');

if (alumniSectionTitle && alumniAccordion) {
    alumniSectionTitle.addEventListener('click', () => {
        alumniAccordion.classList.toggle('show');
    });
}

// Alumni Accordion
const alumniAccordionHeaders = document.querySelectorAll('.alumni-accordion-header');
alumniAccordionHeaders.forEach(header => {
    header.addEventListener('click', (e) => {
        e.stopPropagation(); // Ngăn event bubble lên tiêu đề
        const item = header.parentElement;
        const content = item.querySelector('.alumni-accordion-content');
        const isActive = header.classList.contains('active');

        // Close all other items
        alumniAccordionHeaders.forEach(otherHeader => {
            if (otherHeader !== header) {
                otherHeader.classList.remove('active');
                otherHeader.nextElementSibling.classList.remove('active');
            }
        });

        // Toggle current item
        if (isActive) {
            header.classList.remove('active');
            content.classList.remove('active');
        } else {
            header.classList.add('active');
            content.classList.add('active');
        }
    });
});

// Hero Slideshow
const heroSlides = document.querySelectorAll('.hero-slide');
let currentSlide = 0;

function nextSlide() {
    heroSlides[currentSlide].classList.remove('active');
    currentSlide = (currentSlide + 1) % heroSlides.length;
    heroSlides[currentSlide].classList.add('active');
}

if (heroSlides.length > 0) {
    setInterval(nextSlide, 5000); // Change slide every 5 seconds
}

// Snow Effect
function createSnowflake() {
    const snowContainer = document.querySelector('.snow-container');
    if (!snowContainer) return;

    const snowflake = document.createElement('div');
    snowflake.className = 'snowflake';
    snowflake.innerHTML = '❄';
    snowflake.style.left = Math.random() * 100 + '%';
    snowflake.style.animationDuration = (Math.random() * 3 + 2) + 's';
    snowflake.style.animationDelay = Math.random() * 2 + 's';
    snowflake.style.fontSize = (Math.random() * 10 + 10) + 'px';
    
    snowContainer.appendChild(snowflake);

    setTimeout(() => {
        snowflake.remove();
    }, 5000);
}

// Create snowflakes continuously
if (document.querySelector('.snow-container')) {
    setInterval(createSnowflake, 200);
    // Create initial snowflakes
    for (let i = 0; i < 20; i++) {
        setTimeout(createSnowflake, i * 100);
    }
}

// Christmas Lights
function createChristmasLights() {
    const lightsContainer = document.querySelector('.christmas-lights');
    if (!lightsContainer) return;

    const numLights = 30;
    for (let i = 0; i < numLights; i++) {
        const light = document.createElement('div');
        light.className = 'christmas-light';
        light.style.left = (i * (100 / numLights)) + '%';
        light.style.top = Math.random() * 100 + '%';
        light.style.animationDelay = (Math.random() * 1.5) + 's';
        lightsContainer.appendChild(light);
    }
}

if (document.querySelector('.christmas-lights')) {
    createChristmasLights();
}

// Hiệu ứng parallax cho hoa thiêng tiếng Anh - di chuyển lên xuống khi scroll trang chính
const newsHoaThiengRight = document.querySelector('.news-hoa-thieng-right');
const newsHoaThiengRightImg = document.querySelector('.news-hoa-thieng-right img');

let lastScrollTop = 0;
let ticking = false;

function updateHoaThiengParallax() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const documentHeight = document.documentElement.scrollHeight;
    const windowHeight = window.innerHeight;
    const maxScroll = documentHeight - windowHeight;
    
    if (newsHoaThiengRight && newsHoaThiengRightImg) {
        // Tính toán progress của scroll (0 = đầu trang, 1 = cuối trang)
        const scrollProgress = maxScroll > 0 ? scrollTop / maxScroll : 0;
        
        // Parallax effect - di chuyển lên xuống theo scroll của toàn bộ trang
        // Tốc độ parallax: 0.8 (di chuyển chậm hơn scroll một chút)
        const parallaxSpeed = 0.8;
        const maxOffset = 400; // Di chuyển tối đa 400px lên xuống
        
        // Tính offset: từ -200px (đầu trang) đến +200px (cuối trang)
        // Khi scroll xuống, hình di chuyển xuống; khi scroll lên, hình di chuyển lên
        const offset = (scrollProgress - 0.5) * maxOffset * parallaxSpeed;
        
        // Áp dụng transform cho hình ảnh để di chuyển lên xuống
        // Container giữ nguyên transform: translateY(-50%) để căn giữa
        newsHoaThiengRightImg.style.transform = `translateY(${offset}px)`;
        
        // Thêm class scrolling khi đang scroll
        if (scrollTop > 100) {
            newsHoaThiengRight.classList.add('scrolling');
        } else {
            newsHoaThiengRight.classList.remove('scrolling');
        }
        
        // Hiệu ứng opacity nhẹ khi scroll (tăng độ rõ khi scroll xuống)
        const opacity = 0.5 + (scrollProgress * 0.3); // Từ 0.5 đến 0.8
        newsHoaThiengRightImg.style.opacity = Math.min(1, Math.max(0.5, opacity));
    }
    
    lastScrollTop = scrollTop;
    ticking = false;
}

function requestTick() {
    if (!ticking) {
        window.requestAnimationFrame(updateHoaThiengParallax);
        ticking = true;
    }
}

if (newsHoaThiengRight && newsHoaThiengRightImg) {
    window.addEventListener('scroll', requestTick, { passive: true });
    window.addEventListener('resize', requestTick, { passive: true });
    // Khởi tạo lần đầu
    updateHoaThiengParallax();
}




