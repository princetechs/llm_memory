# UI Style Guide - Llm Memory Application

## 🎨 **Design Philosophy**

The Llm Memory application follows a **modern AI-first design approach** that emphasizes:
- **Clean, professional aesthetics** suitable for business and productivity use
- **Intuitive user experience** with clear visual hierarchy
- **Consistent design language** across all screens and components
- **Accessibility and usability** for all users
- **Responsive design** that works on all device sizes

## 🌈 **Color System**

### **Primary Color Palette**

#### Primary (Blue)
```css
--color-primary-50: #f0f9ff   /* Lightest background */
--color-primary-100: #e0f2fe  /* Light background */
--color-primary-200: #bae6fd  /* Lighter accent */
--color-primary-300: #7dd3fc  /* Light accent */
--color-primary-400: #38bdf8  /* Medium accent */
--color-primary-500: #0ea5e9  /* Base primary */
--color-primary-600: #0284c7  /* Hover state */
--color-primary-700: #0369a1  /* Active state */
--color-primary-800: #075985  /* Dark accent */
--color-primary-900: #0c4a6e  /* Dark background */
--color-primary-950: #082f49  /* Darkest */
```

#### Secondary (Purple)
```css
--color-secondary-50: #fdf4ff   /* Lightest background */
--color-secondary-100: #fae8ff  /* Light background */
--color-secondary-200: #f5d0fe  /* Lighter accent */
--color-secondary-300: #f0abfc  /* Light accent */
--color-secondary-400: #e879f9  /* Medium accent */
--color-secondary-500: #d946ef  /* Base secondary */
--color-secondary-600: #c026d3  /* Hover state */
--color-secondary-700: #a21caf  /* Active state */
--color-secondary-800: #86198f  /* Dark accent */
--color-secondary-900: #701a75  /* Dark background */
--color-secondary-950: #4a044e  /* Darkest */
```

#### Accent (Teal)
```css
--color-accent-50: #f0fdfa   /* Lightest background */
--color-accent-100: #ccfbf1  /* Light background */
--color-accent-200: #99f6e4  /* Lighter accent */
--color-accent-300: #5eead4  /* Light accent */
--color-accent-400: #2dd4bf  /* Medium accent */
--color-accent-500: #14b8a6  /* Base accent */
--color-accent-600: #0d9488  /* Hover state */
--color-accent-700: #0f766e  /* Active state */
--color-accent-800: #115e59  /* Dark accent */
--color-accent-900: #134e4a  /* Dark background */
--color-accent-950: #042f2e  /* Darkest */
```

### **Semantic Colors**

#### Success (Green)
- **Base**: `#22c55e` - Used for success messages, confirmations, and positive actions
- **Light**: `#dcfce7` - Success message backgrounds
- **Dark**: `#166534` - Success text on light backgrounds

#### Warning (Amber)
- **Base**: `#f59e0b` - Used for warnings, alerts, and attention-grabbing elements
- **Light**: `#fef3c7` - Warning message backgrounds
- **Dark**: `#92400e` - Warning text on light backgrounds

#### Error (Red)
- **Base**: `#ef4444` - Used for errors, destructive actions, and critical alerts
- **Light**: `#fee2e2` - Error message backgrounds
- **Dark**: `#991b1b` - Error text on light backgrounds

### **Neutral Colors**
```css
--color-neutral-50: #fafafa   /* Page backgrounds */
--color-neutral-100: #f5f5f5  /* Card backgrounds */
--color-neutral-200: #e5e5e5  /* Borders */
--color-neutral-300: #d4d4d4  /* Dividers */
--color-neutral-400: #a3a3a3  /* Placeholder text */
--color-neutral-500: #737373  /* Secondary text */
--color-neutral-600: #525252  /* Body text */
--color-neutral-700: #404040  /* Headings */
--color-neutral-800: #262626  /* Primary headings */
--color-neutral-900: #171717  /* Dark text on light */
--color-neutral-950: #0a0a0a  /* Darkest backgrounds */
```

## 🔤 **Typography**

### **Font Families**
```css
/* Primary Font - Inter for UI elements */
font-family: 'Inter', system-ui, -apple-system, sans-serif;

/* Monospace Font - JetBrains Mono for code */
font-family: 'JetBrains Mono', 'Fira Code', monospace;
```

### **Font Sizes & Weights**

#### Headings
```css
/* Page Title */
text-4xl font-bold text-neutral-900 font-ai

/* Section Headings */
text-2xl font-bold text-neutral-900 font-ai

/* Card Headings */
text-lg font-semibold text-neutral-900

/* Subsection Headings */
text-base font-medium text-neutral-700
```

#### Body Text
```css
/* Primary Body Text */
text-base text-neutral-700

/* Secondary Text */
text-sm text-neutral-600

/* Caption Text */
text-xs text-neutral-500

/* Large Body Text */
text-lg text-neutral-600
```

#### Interactive Elements
```css
/* Button Text */
text-base font-semibold text-white

/* Link Text */
text-sm text-primary-600 hover:text-primary-700

/* Form Labels */
text-sm font-medium text-neutral-700
```

## 📐 **Spacing System**

### **Standard Spacing Scale**
```css
--spacing-xs: 0.25rem   /* 4px */
--spacing-sm: 0.5rem    /* 8px */
--spacing-md: 1rem      /* 16px */
--spacing-lg: 1.5rem    /* 24px */
--spacing-xl: 2rem      /* 32px */
--spacing-2xl: 3rem     /* 48px */
--spacing-3xl: 4rem     /* 64px */
```

### **Common Spacing Patterns**
```css
/* Page Padding */
px-6 py-8

/* Card Padding */
px-8 py-8

/* Form Spacing */
space-y-6

/* Button Padding */
py-4 px-6

/* Section Margins */
mb-12, mb-8, mb-6
```

## 🔲 **Border Radius**

### **Radius Scale**
```css
--radius-sm: 0.375rem   /* 6px - Small elements */
--radius-md: 0.5rem     /* 8px - Medium elements */
--radius-lg: 0.75rem    /* 12px - Large elements */
--radius-xl: 1rem       /* 16px - Extra large */
--radius-2xl: 1.5rem    /* 24px - Cards */
--radius-full: 9999px   /* Full circle */
```

### **Usage Patterns**
```css
/* Form Inputs */
rounded-xl

/* Cards */
rounded-2xl, rounded-3xl

/* Buttons */
rounded-xl

/* Icons */
rounded-2xl
```

## 🌟 **Shadows & Depth**

### **Shadow Scale**
```css
--shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05)
--shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)
--shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)
--shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)
--shadow-2xl: 0 25px 50px -12px rgb(0 0 0 / 0.25)
```

### **Usage Patterns**
```css
/* Cards */
shadow-lg hover:shadow-xl

/* Buttons */
shadow-lg hover:shadow-xl

/* Floating Elements */
shadow-2xl

/* Subtle Depth */
shadow-sm
```

## 🎭 **Transitions & Animations**

### **Transition Durations**
```css
--transition-fast: 150ms ease-in-out
--transition-normal: 250ms ease-in-out
--transition-slow: 350ms ease-in-out
```

### **Common Transitions**
```css
/* Hover Effects */
transition-all duration-200

/* Button Interactions */
transition-all duration-200 transform hover:scale-105

/* Card Hover */
transition-all duration-200 hover:-translate-y-1

/* Form Focus */
transition-all duration-200
```

### **Custom Animations**
```css
/* Fade In Up */
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(30px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Float */
@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
}

/* Glow */
@keyframes glow {
  0% { box-shadow: 0 0 20px rgba(14, 165, 233, 0.3); }
  100% { box-shadow: 0 0 30px rgba(14, 165, 233, 0.6); }
}
```

## 🎨 **Background Patterns**

### **Gradient Backgrounds**
```css
/* Primary Gradient */
bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50

/* Card Backgrounds */
bg-white/80 backdrop-blur-sm

/* Button Gradients */
bg-gradient-to-r from-primary-600 to-secondary-600
```

### **Glass Morphism Effects**
```css
/* Translucent Cards */
bg-white/80 backdrop-blur-sm

/* Border Effects */
border border-white/20

/* Enhanced Blur */
backdrop-filter: blur(16px)
```

## 🔧 **CSS Classes Reference**

### **Layout Classes**
```css
/* Full Screen Layout */
min-h-screen

/* Centered Content */
flex items-center justify-center

/* Responsive Containers */
max-w-7xl mx-auto px-6 py-8

/* Card Layouts */
w-full max-w-md
```

### **Component Classes**
```css
/* Form Cards */
bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl

/* Interactive Elements */
hover:scale-105 hover:shadow-xl active:scale-95

/* Focus States */
focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500
```

## 📱 **Responsive Design**

### **Breakpoint System**
```css
/* Mobile First */
sm: 640px   /* Small devices */
md: 768px   /* Medium devices */
lg: 1024px  /* Large devices */
xl: 1280px  /* Extra large devices */
2xl: 1536px /* 2X large devices */
```

### **Responsive Patterns**
```css
/* Grid Layouts */
grid-cols-1 md:grid-cols-2 lg:grid-cols-3

/* Spacing Adjustments */
px-4 md:px-6 lg:px-8

/* Text Sizes */
text-2xl md:text-3xl lg:text-4xl
```

## 🎯 **Design Principles**

### **Visual Hierarchy**
1. **Primary Actions**: Use primary colors and larger sizes
2. **Secondary Actions**: Use secondary colors and medium sizes
3. **Information**: Use neutral colors and appropriate text sizes
4. **Feedback**: Use semantic colors for status and alerts

### **Consistency Rules**
- Always use the defined color palette
- Maintain consistent spacing between related elements
- Use consistent border radius for similar components
- Apply consistent shadow levels for similar depth
- Maintain consistent typography hierarchy

### **Accessibility Guidelines**
- Ensure sufficient color contrast (WCAG AA compliance)
- Use semantic colors for status indicators
- Provide clear focus states for keyboard navigation
- Maintain readable font sizes and line heights
- Use appropriate spacing for touch targets

---

**Last Updated**: <%= Date.current.strftime("%B %d, %Y") %>
**Version**: 1.0.0
**Next Review**: <%= (Date.current + 30.days).strftime("%B %d, %Y") %>
