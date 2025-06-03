document.addEventListener('DOMContentLoaded', function() {
    // Get all slides and navigation buttons
    const slides = document.querySelectorAll('.slide');
    const totalSlides = slides.length;
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const currentSlideIndicator = document.getElementById('current-slide');
    const totalSlidesIndicator = document.getElementById('total-slides');
    
    // Set total slides indicator
    totalSlidesIndicator.textContent = totalSlides;
    
    // Track current slide
    let currentSlideIndex = 0;
    
    // Function to show a specific slide
    function showSlide(index) {
        // Ensure index is within bounds
        if (index < 0) index = 0;
        if (index >= totalSlides) index = totalSlides - 1;
        
        // Update current slide index
        currentSlideIndex = index;
        
        // Hide all slides
        slides.forEach(slide => {
            slide.classList.remove('active');
        });
        
        // Show the current slide
        slides[currentSlideIndex].classList.add('active');
        
        // Update slide counter
        currentSlideIndicator.textContent = currentSlideIndex + 1;
        
        // Update button states
        prevBtn.disabled = currentSlideIndex === 0;
        nextBtn.disabled = currentSlideIndex === totalSlides - 1;
    }
    
    // Event listeners for navigation buttons
    prevBtn.addEventListener('click', function() {
        showSlide(currentSlideIndex - 1);
    });
    
    nextBtn.addEventListener('click', function() {
        showSlide(currentSlideIndex + 1);
    });
    
    // Keyboard navigation
    document.addEventListener('keydown', function(e) {
        switch(e.key) {
            case 'ArrowLeft':
                showSlide(currentSlideIndex - 1);
                break;
            case 'ArrowRight':
            case ' ': // Space key
                showSlide(currentSlideIndex + 1);
                break;
            case 'Home':
                showSlide(0);
                break;
            case 'End':
                showSlide(totalSlides - 1);
                break;
        }
    });

    // Initialize button states
    prevBtn.disabled = currentSlideIndex === 0;
    
    // Add click events to demonstration buttons in the Next Steps slide
    const demoButton = document.querySelector('.final-cta .btn--primary');
    if (demoButton) {
        demoButton.addEventListener('click', function() {
            alert('Thank you for your interest! A demo session will be scheduled soon.');
        });
    }
    
    const sourceCodeButton = document.querySelector('.final-cta .btn--secondary');
    if (sourceCodeButton) {
        sourceCodeButton.addEventListener('click', function() {
            window.open('https://github.com/MarcuTamas/gust', '_blank');
        });
    }

    // Function to animate progress bars and counters
    function animateElements() {
        // Only animate elements in the current visible slide
        const currentSlide = slides[currentSlideIndex];
        
        // Animate progress bars
        const progressBars = currentSlide.querySelectorAll('.progress-mock');
        progressBars.forEach(bar => {
            bar.classList.add('animated');
        });
        
        // Add animation classes to cards when they appear
        const cards = currentSlide.querySelectorAll('.feature-card, .overview-card, .tech-box, .innovation-item, .step-card');
        cards.forEach((card, index) => {
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 100);
        });
    }
    
    // Initialize all cards with starting styles for animation
    const allCards = document.querySelectorAll('.feature-card, .overview-card, .tech-box, .innovation-item, .step-card');
    allCards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });
    
    // Run animations when slide changes
    function handleSlideChange() {
        // Reset animations
        const allProgressBars = document.querySelectorAll('.progress-mock');
        allProgressBars.forEach(bar => {
            bar.classList.remove('animated');
        });
        
        // Apply new animations
        setTimeout(animateElements, 100);
    }
    
    // Observer for slide changes
    const slideObserver = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            if (mutation.attributeName === 'class' && 
                mutation.target.classList.contains('active')) {
                handleSlideChange();
            }
        });
    });
    
    // Observe all slides for class changes
    slides.forEach(slide => {
        slideObserver.observe(slide, { attributes: true });
    });
    
    // Initialize first slide
    showSlide(0);
    setTimeout(animateElements, 500);
});