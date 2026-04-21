# Carrossel Reforma Simples Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace CSS device mockup with image carousel displaying f1.png through f5.png with auto-play and manual controls

**Architecture:** Single-file implementation adding carousel HTML structure, CSS styling, and vanilla JavaScript functionality within existing index.html

**Tech Stack:** HTML5, CSS3 (with existing CSS variables), Vanilla JavaScript, existing font stack (Inter + JetBrains Mono)

---

### Task 1: Add Carousel CSS Styles

**Files:**
- Modify: `index.html` (add CSS after existing device styles around line 950)

- [ ] **Step 1: Add carousel container styles**

Add after the existing `.project` CSS styles:

```css
/* ========== CAROUSEL ========== */
.carousel-container {
  position: relative;
  max-width: 300px;
  transform: rotate(-3deg);
  border-radius: 24px;
  box-shadow: 0 35px 80px rgba(0,0,0,0.45);
  overflow: hidden;
  background: var(--bg-soft);
  border: 1px solid var(--line);
}

.carousel-images {
  position: relative;
  width: 100%;
  height: 400px;
}

.carousel-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
}

.carousel-image.active {
  opacity: 1;
}
```

- [ ] **Step 2: Add carousel dots styling**

```css
.carousel-dots {
  display: flex;
  justify-content: center;
  gap: 0.5rem;
  padding: 1rem;
  background: linear-gradient(to top, var(--bg-soft), transparent);
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
}

.dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  border: none;
  background: var(--text-mute);
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot:hover {
  background: var(--accent);
  transform: scale(1.2);
}

.dot.active {
  background: var(--accent);
}
```

- [ ] **Step 3: Add responsive carousel styles**

```css
/* Responsive carousel */
@media (max-width: 768px) {
  .carousel-container {
    max-width: 250px;
  }
  
  .carousel-images {
    height: 350px;
  }
}

@media (max-width: 480px) {
  .carousel-container {
    max-width: 200px;
  }
  
  .carousel-images {
    height: 280px;
  }
  
  .dot {
    width: 6px;
    height: 6px;
  }
}
```

- [ ] **Step 4: Test CSS styling**

Save file and open in browser to verify carousel container appears with proper styling (even without images yet).

- [ ] **Step 5: Commit CSS changes**

```bash
git add index.html
git commit -m "feat: add carousel CSS styles with responsive design"
```

### Task 2: Replace Device Mockup with Carousel HTML

**Files:**
- Modify: `index.html:1370-1500` (replace device mockup section)

- [ ] **Step 1: Locate and backup device mockup section**

Find the section starting with `<div class="project-visual reveal d1">` around line 1370 and ending with the device caption around line 1492.

- [ ] **Step 2: Replace device mockup with carousel HTML**

Replace the entire device mockup section with:

```html
<div class="project-visual reveal d1">
  <div class="carousel-container">
    <div class="carousel-images">
      <img src="f1.png" alt="Reforma Simples - Tela Principal" class="carousel-image active">
      <img src="f2.png" alt="Reforma Simples - Lista de Materiais" class="carousel-image">
      <img src="f3.png" alt="Reforma Simples - Calculadora" class="carousel-image">
      <img src="f4.png" alt="Reforma Simples - Resultados" class="carousel-image">
      <img src="f5.png" alt="Reforma Simples - Configurações" class="carousel-image">
    </div>
    <div class="carousel-dots">
      <button class="dot active" data-slide="0" aria-label="Ver primeira tela"></button>
      <button class="dot" data-slide="1" aria-label="Ver segunda tela"></button>
      <button class="dot" data-slide="2" aria-label="Ver terceira tela"></button>
      <button class="dot" data-slide="3" aria-label="Ver quarta tela"></button>
      <button class="dot" data-slide="4" aria-label="Ver quinta tela"></button>
    </div>
  </div>
</div>
<div class="device-caption">imagens do app Reforma Simples</div>
```

- [ ] **Step 3: Remove old device CSS styles**

Find and remove all CSS rules starting with `.rs-*` (Reforma Simples mockup styles) and the entire `.device` related CSS block.

- [ ] **Step 4: Test HTML structure**

Save and refresh browser to verify:
- Images load correctly
- Carousel container has proper dimensions
- Dots are positioned correctly
- Only first image (f1.png) is visible with active class

- [ ] **Step 5: Commit HTML changes**

```bash
git add index.html
git commit -m "feat: replace device mockup with carousel HTML structure"
```

### Task 3: Implement Carousel JavaScript Functionality

**Files:**
- Modify: `index.html` (add JavaScript before closing `</body>` tag)

- [ ] **Step 1: Add carousel initialization JavaScript**

Add before the existing theme toggle script:

```javascript
// Carousel functionality
class ImageCarousel {
  constructor(container) {
    this.container = container;
    this.images = container.querySelectorAll('.carousel-image');
    this.dots = container.querySelectorAll('.dot');
    this.currentSlide = 0;
    this.autoPlayTimer = null;
    this.isPlaying = true;
    
    this.init();
  }
  
  init() {
    // Add event listeners for dots
    this.dots.forEach((dot, index) => {
      dot.addEventListener('click', () => this.goToSlide(index));
    });
    
    // Add hover pause functionality
    this.container.addEventListener('mouseenter', () => this.pauseAutoPlay());
    this.container.addEventListener('mouseleave', () => this.resumeAutoPlay());
    
    // Start auto-play
    this.startAutoPlay();
  }
```

- [ ] **Step 2: Add slide transition methods**

```javascript
  goToSlide(slideIndex) {
    // Remove active class from current slide and dot
    this.images[this.currentSlide].classList.remove('active');
    this.dots[this.currentSlide].classList.remove('active');
    
    // Update current slide index
    this.currentSlide = slideIndex;
    
    // Add active class to new slide and dot
    this.images[this.currentSlide].classList.add('active');
    this.dots[this.currentSlide].classList.add('active');
  }
  
  nextSlide() {
    const nextIndex = (this.currentSlide + 1) % this.images.length;
    this.goToSlide(nextIndex);
  }
```

- [ ] **Step 3: Add auto-play control methods**

```javascript
  startAutoPlay() {
    if (this.isPlaying) {
      this.autoPlayTimer = setInterval(() => {
        this.nextSlide();
      }, 4000);
    }
  }
  
  pauseAutoPlay() {
    if (this.autoPlayTimer) {
      clearInterval(this.autoPlayTimer);
      this.autoPlayTimer = null;
    }
  }
  
  resumeAutoPlay() {
    if (this.isPlaying && !this.autoPlayTimer) {
      this.startAutoPlay();
    }
  }
}
```

- [ ] **Step 4: Initialize carousel on page load**

```javascript
// Initialize carousel when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  const carouselContainer = document.querySelector('.carousel-container');
  if (carouselContainer) {
    new ImageCarousel(carouselContainer);
  }
});
```

- [ ] **Step 5: Test carousel functionality**

Save and test in browser:
- Auto-play advances slides every 4 seconds
- Clicking dots changes slides immediately
- Hovering pauses auto-play
- Mouse leave resumes auto-play
- Transitions are smooth

- [ ] **Step 6: Commit JavaScript functionality**

```bash
git add index.html
git commit -m "feat: implement carousel auto-play and manual controls"
```

### Task 4: Optimize and Test Complete Implementation

**Files:**
- Modify: `index.html` (final optimizations and testing)

- [ ] **Step 1: Add loading optimization**

Add image preloading hint in the `<head>` section:

```html
<!-- Preload carousel images -->
<link rel="preload" as="image" href="f1.png">
<link rel="preload" as="image" href="f2.png">
<link rel="preload" as="image" href="f3.png">
<link rel="preload" as="image" href="f4.png">
<link rel="preload" as="image" href="f5.png">
```

- [ ] **Step 2: Test carousel across different screen sizes**

Test responsive behavior:
- Desktop (1200px+): 300px max-width, normal dots
- Tablet (768px): 250px max-width, normal dots  
- Mobile (480px): 200px max-width, smaller dots

- [ ] **Step 3: Test carousel with both themes**

Switch between dark and light themes and verify:
- Dots use correct theme colors (var(--text-mute) and var(--accent))
- Container border uses var(--line)
- Background gradients work with theme variables

- [ ] **Step 4: Test accessibility features**

Verify:
- All images have proper alt text
- Dots have aria-label attributes
- Keyboard navigation works (tab to dots, space/enter to activate)
- Focus states are visible

- [ ] **Step 5: Performance test**

Check:
- No console errors in browser developer tools
- Smooth transitions without jank
- Auto-play timer doesn't conflict with other page functionality
- Memory usage stable during long auto-play sessions

- [ ] **Step 6: Final commit and cleanup**

```bash
git add index.html
git commit -m "feat: optimize carousel performance and accessibility

- Add image preloading for faster transitions
- Verify responsive design across all breakpoints  
- Ensure theme integration with CSS variables
- Test accessibility and keyboard navigation

Complete implementation of carousel replacing device mockup"
```

### Task 5: Validation and Documentation

**Files:**
- Test: Complete carousel implementation in browser
- Document: Update any relevant documentation

- [ ] **Step 1: Complete end-to-end test**

Perform comprehensive test:
1. Load page and verify first image (f1.png) displays
2. Wait 4 seconds, confirm auto-advance to f2.png
3. Click dot 4 to jump to f5.png
4. Hover over carousel, verify auto-play stops
5. Mouse leave, verify auto-play resumes
6. Test on mobile viewport (responsive)
7. Switch themes, verify styling adapts

- [ ] **Step 2: Cross-browser compatibility check**

Test in different browsers:
- Chrome/Edge (Chromium)
- Firefox  
- Safari (if available)

- [ ] **Step 3: Verify spec requirements met**

Check against original spec:
- ✅ Exact same positioning as original mockup
- ✅ 5 images cycling automatically every 4 seconds
- ✅ Manual navigation via dots
- ✅ Pause on hover functionality
- ✅ Responsive design (300px → 250px → 200px)
- ✅ Theme integration with CSS variables
- ✅ Smooth fade transitions

- [ ] **Step 4: Update project documentation if needed**

If any project documentation mentions the old device mockup, update to reflect the new carousel implementation.

- [ ] **Step 5: Final commit and cleanup**

```bash
git add .
git commit -m "docs: update carousel implementation validation

All spec requirements verified:
- Auto-play carousel with 5 project images
- Manual dot navigation with hover states
- Responsive design with theme integration
- Performance optimized with accessibility features"
```

---

## Self-Review Checklist

**1. Spec coverage:** 
- ✅ Image carousel with f1-f5.png - Task 2
- ✅ Auto-play every 4 seconds - Task 3  
- ✅ Manual dot controls - Task 3
- ✅ Pause on hover - Task 3
- ✅ Same positioning as mockup - Task 1 & 2
- ✅ Responsive design - Task 1
- ✅ Theme integration - Task 1 & 4
- ✅ Smooth transitions - Task 1 & 3

**2. Placeholder scan:** All code blocks contain complete implementation, no TBD/TODO items, specific file paths and line numbers provided.

**3. Type consistency:** Class names (.carousel-container, .carousel-image, .dot, etc.) consistent across HTML, CSS, and JavaScript. Method names (goToSlide, nextSlide, etc.) consistent throughout JavaScript implementation.