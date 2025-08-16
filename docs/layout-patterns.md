# Layout Patterns - Llm Memory Application

## 🏗️ **Layout System Overview**

The Llm Memory application uses a **consistent, responsive layout system** that ensures:
- **Full-screen experiences** without mobile constraints
- **Professional spacing** and visual hierarchy
- **Responsive behavior** across all device sizes
- **Consistent component positioning** and alignment
- **Optimal use of screen real estate** on all devices

## 📱 **Responsive Breakpoint System**

### **Breakpoint Definitions**
```css
/* Mobile First Approach */
sm: 640px   /* Small devices (tablets) */
md: 768px   /* Medium devices (small laptops) */
lg: 1024px  /* Large devices (laptops) */
xl: 1280px  /* Extra large devices (desktops) */
2xl: 1536px /* 2X large devices (large desktops) */
```

### **Breakpoint Usage Patterns**
```css
/* Responsive Grid */
grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4

/* Responsive Spacing */
px-4 md:px-6 lg:px-8 xl:px-12

/* Responsive Typography */
text-lg md:text-xl lg:text-2xl xl:text-3xl

/* Responsive Margins */
mb-6 md:mb-8 lg:mb-12 xl:mb-16
```

## 🎨 **Page Layout Patterns**

### **Full-Screen Authentication Layout**
Used for login, registration, and password reset pages.

```html
<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50 p-4">
  <div class="w-full max-w-md">
    <!-- Authentication card content -->
  </div>
</div>
```

**Key Features**:
- `min-h-screen` ensures full viewport height
- `flex items-center justify-center` centers content perfectly
- `p-4` provides consistent edge padding
- `max-w-md` constrains card width for optimal readability

**Usage**: All authentication and onboarding screens.

### **Dashboard Layout**
Used for authenticated user pages with navigation header.

```html
<div class="min-h-screen bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50">
  <!-- Header Navigation -->
  <div class="bg-white/80 backdrop-blur-sm border-b border-white/20 shadow-lg">
    <div class="max-w-7xl mx-auto px-6 py-6">
      <!-- Header content -->
    </div>
  </div>

  <!-- Main Content -->
  <div class="max-w-7xl mx-auto px-6 py-8">
    <!-- Page sections -->
  </div>
</div>
```

**Key Features**:
- Fixed header with glass morphism effect
- `max-w-7xl` provides wide content area for desktop
- `px-6 py-8` ensures consistent content padding
- Responsive container that adapts to screen size

**Usage**: Dashboard, settings, and other authenticated pages.

## 📐 **Grid System Patterns**

### **Responsive Card Grids**
Flexible grid layouts that adapt to screen size.

```html
<!-- 4-Column Grid (Desktop) -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
  <!-- Grid items -->
</div>

<!-- 3-Column Grid (Common) -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <!-- Grid items -->
</div>

<!-- 2-Column Grid (Compact) -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
  <!-- Grid items -->
</div>
```

**Spacing Guidelines**:
- **Small gaps**: `gap-4` for tight layouts
- **Medium gaps**: `gap-6` for standard layouts (recommended)
- **Large gaps**: `gap-8` for spacious layouts

### **Flexbox Layout Patterns**
Flexible layouts for dynamic content.

```html
<!-- Centered Content -->
<div class="flex items-center justify-center">
  <!-- Centered content -->
</div>

<!-- Space Between -->
<div class="flex items-center justify-between">
  <!-- Left and right aligned content -->
</div>

<!-- Space Around -->
<div class="flex items-center justify-around">
  <!-- Evenly distributed content -->
</div>

<!-- Stacked Items -->
<div class="flex flex-col space-y-4">
  <!-- Vertically stacked content -->
</div>
```

## 🎴 **Card Layout Patterns**

### **Standard Card Layout**
Consistent card structure with proper spacing.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl border border-white/20 overflow-hidden">
  <!-- Card Header -->
  <div class="px-8 py-8">
    <!-- Header content -->
  </div>
  
  <!-- Card Body -->
  <div class="px-8 py-8">
    <!-- Body content -->
  </div>
  
  <!-- Card Footer -->
  <div class="px-8 py-6 bg-neutral-50/50">
    <!-- Footer content -->
  </div>
</div>
```

**Spacing Standards**:
- **Header**: `px-8 py-8` for prominent headers
- **Body**: `px-8 py-8` for main content
- **Footer**: `px-8 py-6` for compact footers
- **Compact**: `px-6 py-6` for smaller cards

### **Interactive Card Layout**
Cards with hover effects and interactive elements.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-2xl border border-white/20 p-6 shadow-lg hover:shadow-xl transition-all duration-200 hover:-translate-y-1">
  <!-- Card content with hover effects -->
</div>
```

**Hover Effects**:
- `hover:shadow-xl` - Enhanced shadow on hover
- `hover:-translate-y-1` - Subtle upward movement
- `transition-all duration-200` - Smooth transitions

## 📱 **Mobile-First Responsive Patterns**

### **Stack to Grid Pattern**
Content stacks vertically on mobile, becomes grid on larger screens.

```html
<!-- Mobile: Single column, Desktop: Multi-column -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <div class="bg-white/80 backdrop-blur-sm rounded-2xl p-6">
    <!-- Card 1 -->
  </div>
  <div class="bg-white/80 backdrop-blur-sm rounded-2xl p-6">
    <!-- Card 2 -->
  </div>
  <div class="bg-white/80 backdrop-blur-sm rounded-2xl p-6">
    <!-- Card 3 -->
  </div>
</div>
```

### **Responsive Text Sizing**
Typography that scales appropriately across devices.

```html
<!-- Responsive heading sizes -->
<h1 class="text-2xl md:text-3xl lg:text-4xl font-bold text-neutral-900">
  Page Title
</h1>

<!-- Responsive body text -->
<p class="text-base md:text-lg text-neutral-600">
  Body text that scales appropriately
</p>
```

### **Responsive Spacing**
Padding and margins that adapt to screen size.

```html
<!-- Responsive container padding -->
<div class="px-4 md:px-6 lg:px-8 xl:px-12">
  <!-- Content with adaptive spacing -->
</div>

<!-- Responsive section margins -->
<div class="mb-6 md:mb-8 lg:mb-12">
  <!-- Section with adaptive margins -->
</div>
```

## 🎯 **Content Organization Patterns**

### **Section Layout Pattern**
Consistent section structure with proper spacing.

```html
<!-- Section with heading and content -->
<div class="mb-12">
  <!-- Section Header -->
  <div class="text-center mb-8">
    <h2 class="text-2xl font-bold text-neutral-900 font-ai mb-4">Section Title</h2>
    <p class="text-lg text-neutral-600 max-w-2xl mx-auto">Section description</p>
  </div>
  
  <!-- Section Content -->
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <!-- Section items -->
  </div>
</div>
```

**Spacing Standards**:
- **Section margin**: `mb-12` for major sections
- **Header margin**: `mb-8` for section headers
- **Content spacing**: `space-y-6` for stacked content

### **Hero Section Pattern**
Prominent section for main page content.

```html
<!-- Hero section with centered content -->
<div class="text-center mb-12">
  <!-- Hero Icon -->
  <div class="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-r from-primary-100 to-secondary-100 rounded-3xl mb-6">
    <svg class="w-12 h-12 text-primary-600">
      <!-- Hero icon -->
    </svg>
  </div>
  
  <!-- Hero Title -->
  <h1 class="text-4xl font-bold text-neutral-900 mb-4 font-ai">Hero Title</h1>
  
  <!-- Hero Description -->
  <p class="text-xl text-neutral-600 max-w-2xl mx-auto">Hero description text</p>
</div>
```

## 🔧 **Layout Utility Classes**

### **Common Layout Utilities**
```css
/* Full screen layouts */
min-h-screen

/* Centered content */
flex items-center justify-center

/* Responsive containers */
max-w-7xl mx-auto

/* Consistent padding */
px-6 py-8

/* Section spacing */
mb-12, mb-8, mb-6

/* Card layouts */
w-full max-w-md
```

### **Responsive Utilities**
```css
/* Responsive visibility */
hidden md:block
block md:hidden

/* Responsive positioning */
static md:relative
relative lg:absolute

/* Responsive sizing */
w-full md:w-auto
h-32 md:h-40 lg:h-48
```

## 📋 **Layout Best Practices**

### **Spacing Consistency**
- Use the defined spacing scale (`mb-6`, `mb-8`, `mb-12`)
- Maintain consistent padding within similar components
- Use `space-y-*` utilities for stacked content
- Ensure adequate breathing room between sections

### **Responsive Design**
- Always start with mobile layout
- Use progressive enhancement for larger screens
- Test layouts on all breakpoints
- Ensure touch targets are appropriately sized

### **Visual Hierarchy**
- Use larger margins between major sections
- Group related content with consistent spacing
- Use cards to create visual separation
- Maintain consistent alignment patterns

### **Performance Considerations**
- Minimize layout shifts during responsive changes
- Use CSS Grid and Flexbox for efficient layouts
- Avoid complex nested layouts on mobile
- Consider reducing animations on lower-end devices

## 🎨 **Layout Examples by Page Type**

### **Authentication Pages**
```html
<!-- Login/Register Layout -->
<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50 p-4">
  <div class="w-full max-w-md">
    <div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl border border-white/20 overflow-hidden">
      <!-- Card content -->
    </div>
  </div>
</div>
```

### **Dashboard Pages**
```html
<!-- Dashboard Layout -->
<div class="min-h-screen bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50">
  <!-- Header -->
  <header class="bg-white/80 backdrop-blur-sm border-b border-white/20 shadow-lg">
    <!-- Header content -->
  </header>
  
  <!-- Main content -->
  <main class="max-w-7xl mx-auto px-6 py-8">
    <!-- Dashboard sections -->
  </main>
</div>
```

### **Content Pages**
```html
<!-- Content Page Layout -->
<div class="min-h-screen bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50">
  <!-- Page header -->
  <div class="bg-white/80 backdrop-blur-sm border-b border-white/20 shadow-lg">
    <!-- Page header content -->
  </div>
  
  <!-- Page content -->
  <div class="max-w-4xl mx-auto px-6 py-8">
    <!-- Page content sections -->
  </div>
</div>
```

---

**Last Updated**: <%= Date.current.strftime("%B %d, %Y") %>
**Version**: 1.0.0
**Next Review**: <%= (Date.current + 30.days).strftime("%B %d, %Y") %>
