# Component Library - Llm Memory Application

## 🧩 **Component Overview**

This document provides a comprehensive guide to all reusable UI components in the Llm Memory application. Each component includes:
- **Visual description** and purpose
- **Code examples** with Tailwind CSS classes
- **Usage patterns** and best practices
- **Variants** and customization options
- **Accessibility considerations**

## 🎨 **Layout Components**

### **Page Container**
The main wrapper for full-screen pages with gradient backgrounds.

```html
<div class="min-h-screen bg-gradient-to-br from-neutral-50 via-primary-50 to-secondary-50">
  <!-- Page content here -->
</div>
```

**Usage**: Use for all main page layouts to ensure full-screen coverage and consistent background styling.

### **Content Container**
Responsive container for page content with proper spacing.

```html
<div class="max-w-7xl mx-auto px-6 py-8">
  <!-- Page sections here -->
</div>
```

**Usage**: Wrap main content sections to ensure proper centering and responsive padding.

### **Card Container**
Glass morphism card with backdrop blur and translucent background.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl border border-white/20 overflow-hidden">
  <!-- Card content here -->
</div>
```

**Variants**:
- **Small**: `rounded-2xl` for compact cards
- **Large**: `rounded-3xl` for prominent cards
- **Interactive**: Add `hover:shadow-xl transition-all duration-200`

## 🔘 **Button Components**

### **Primary Button**
Main action button with gradient background and hover effects.

```html
<button class="inline-flex items-center justify-center py-4 px-6 border border-transparent rounded-xl shadow-lg text-base font-semibold text-white bg-gradient-to-r from-primary-600 to-secondary-600 hover:from-primary-700 hover:to-secondary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-all duration-200 transform hover:scale-105 hover:shadow-xl active:scale-95">
  Button Text
</button>
```

**Usage**: Use for primary actions like form submissions, main CTAs, and important user actions.

### **Secondary Button**
Secondary action button with outline style.

```html
<button class="inline-flex items-center justify-center py-4 px-6 border border-neutral-200 rounded-xl shadow-sm text-base font-medium text-neutral-700 bg-white/80 backdrop-blur-sm hover:bg-white hover:border-primary-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-all duration-200 hover:shadow-md">
  Button Text
</button>
```

**Usage**: Use for secondary actions, alternative options, and less prominent actions.

### **Icon Button**
Button with icon and text, commonly used in navigation.

```html
<button class="inline-flex items-center px-4 py-2 border border-neutral-200 text-neutral-700 bg-white/80 backdrop-blur-sm rounded-xl hover:bg-white hover:border-error-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-error-500 transition-all duration-200">
  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <!-- Icon path here -->
  </svg>
  Button Text
</button>
```

**Usage**: Use for actions that benefit from visual icons, like navigation buttons and action buttons.

## 📝 **Form Components**

### **Text Input**
Standard text input with icon, label, and enhanced styling.

```html
<div>
  <label for="input_id" class="block text-sm font-medium text-neutral-700 mb-3">
    Label Text
  </label>
  <div class="relative group">
    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
      <svg class="w-5 h-5 text-neutral-400 group-focus-within:text-primary-500 transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <!-- Icon path here -->
      </svg>
    </div>
    <input type="text" id="input_id" required 
           class="block w-full pl-12 pr-4 py-4 border border-neutral-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all duration-200 bg-white/50 backdrop-blur-sm hover:bg-white/70 focus:bg-white"
           placeholder="Placeholder text">
  </div>
</div>
```

**Features**:
- Icon support with focus state color changes
- Hover and focus effects
- Backdrop blur background
- Consistent spacing and typography

### **Password Input**
Secure password input with enhanced security styling.

```html
<div>
  <label for="password" class="block text-sm font-medium text-neutral-700 mb-3">
    Password
  </label>
  <div class="relative group">
    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
      <svg class="w-5 h-5 text-neutral-400 group-focus-within:text-primary-500 transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
      </svg>
    </div>
    <input type="password" id="password" required 
           class="block w-full pl-12 pr-4 py-4 border border-neutral-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all duration-200 bg-white/50 backdrop-blur-sm hover:bg-white/70 focus:bg-white"
           placeholder="Enter your password">
  </div>
</div>
```

**Usage**: Use for all password fields with consistent styling and security indicators.

### **Checkbox Input**
Styled checkbox with label and focus states.

```html
<div class="flex items-start">
  <input id="checkbox_id" name="checkbox_name" type="checkbox" required 
         class="h-4 w-4 text-primary-600 focus:ring-primary-500 border-neutral-300 rounded transition-colors duration-200 mt-1">
  <label for="checkbox_id" class="ml-3 block text-sm text-neutral-700">
    Checkbox label text
  </label>
</div>
```

**Usage**: Use for boolean inputs, terms acceptance, and option selection.

## 🎴 **Card Components**

### **Stats Card**
Information card displaying key metrics with icons.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-2xl border border-white/20 p-6 shadow-lg hover:shadow-xl transition-all duration-200 hover:-translate-y-1">
  <div class="flex items-center">
    <div class="p-3 bg-primary-100 rounded-xl">
      <svg class="w-6 h-6 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <!-- Icon path here -->
      </svg>
    </div>
    <div class="ml-4">
      <p class="text-sm font-medium text-neutral-600">Metric Label</p>
      <p class="text-3xl font-bold text-neutral-900">Metric Value</p>
    </div>
  </div>
</div>
```

**Usage**: Display key performance indicators, user statistics, and important numbers.

### **Action Card**
Interactive card for user actions with hover effects.

```html
<button class="group p-6 bg-gradient-to-br from-primary-50 to-primary-100 border border-primary-200 rounded-2xl hover:from-primary-100 hover:to-primary-200 transition-all duration-200 transform hover:scale-105 hover:shadow-lg">
  <div class="flex items-center justify-center w-12 h-12 bg-primary-500 rounded-xl mb-4 group-hover:bg-primary-600 transition-colors duration-200">
    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <!-- Icon path here -->
    </svg>
  </div>
  <h4 class="text-lg font-semibold text-neutral-900 mb-2">Action Title</h4>
  <p class="text-neutral-600 text-sm">Action description</p>
</button>
```

**Usage**: Use for quick actions, feature access, and interactive elements.

## 📱 **Navigation Components**

### **Header Navigation**
Top navigation bar with logo, title, and user actions.

```html
<div class="bg-white/80 backdrop-blur-sm border-b border-white/20 shadow-lg">
  <div class="max-w-7xl mx-auto px-6 py-6">
    <div class="flex items-center justify-between">
      <div class="flex items-center space-x-4">
        <div class="w-12 h-12 bg-gradient-to-r from-primary-600 to-secondary-600 rounded-2xl flex items-center justify-center">
          <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <!-- Logo icon here -->
          </svg>
        </div>
        <div>
          <h1 class="text-2xl font-bold text-neutral-900 font-ai">Application Name</h1>
          <p class="text-neutral-600">Application description</p>
        </div>
      </div>
      
      <div class="flex items-center space-x-4">
        <!-- User info and actions here -->
      </div>
    </div>
  </div>
</div>
```

**Usage**: Use as the main navigation header for authenticated pages.

## 🔔 **Feedback Components**

### **Success Message**
Green notification for successful actions.

```html
<div class="bg-success-100 border border-success-200 text-success-800 px-4 py-3 rounded-lg shadow-lg border-l-4 border-l-success-500">
  <div class="flex items-center">
    <svg class="w-5 h-5 text-success-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
    </svg>
    Success message text
  </div>
</div>
```

### **Error Message**
Red notification for errors and issues.

```html
<div class="bg-error-100 border border-error-200 text-error-800 px-4 py-3 rounded-lg shadow-lg border-l-4 border-l-error-500">
  <div class="flex items-center">
    <svg class="w-5 h-5 text-error-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
    </svg>
    Error message text
  </div>
</div>
```

### **Warning Message**
Amber notification for warnings and alerts.

```html
<div class="bg-warning-100 border border-warning-200 text-warning-800 px-4 py-3 rounded-lg shadow-lg border-l-4 border-l-warning-500">
  <div class="flex items-center">
    <svg class="w-5 h-5 text-warning-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.34 16.5c-.77.833.192 2.5 1.732 2.5z"></path>
    </svg>
    Warning message text
  </div>
</div>
```

## 🎭 **Animation Components**

### **Fade In Card**
Card with entrance animation.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl border border-white/20 overflow-hidden form-card">
  <!-- Card content here -->
</div>
```

**CSS Class**: `.form-card` applies `animation: fadeInUp 0.8s ease-out`

### **Hover Card**
Card with enhanced hover effects.

```html
<div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-2xl border border-white/20 overflow-hidden card-hover">
  <!-- Card content here -->
</div>
```

**CSS Class**: `.card-hover` applies hover transform and shadow effects.

## 🔧 **Utility Components**

### **Divider**
Section separator with centered text.

```html
<div class="relative">
  <div class="absolute inset-0 flex items-center">
    <div class="w-full border-t border-neutral-200"></div>
  </div>
  <div class="relative flex justify-center text-sm">
    <span class="px-4 bg-white/80 text-neutral-500 font-medium">Divider Text</span>
  </div>
</div>
```

**Usage**: Separate different sections of content with descriptive text.

### **Loading Spinner**
Animated loading indicator.

```html
<div class="flex items-center justify-center">
  <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-600"></div>
  <span class="ml-2 text-neutral-600">Loading...</span>
</div>
```

**Usage**: Show loading states during async operations.

## 📋 **Component Usage Guidelines**

### **When to Use Each Component**

1. **Layout Components**: Always use for page structure and content organization
2. **Button Components**: Use appropriate button type based on action importance
3. **Form Components**: Use for all user input and data collection
4. **Card Components**: Use for content grouping and information display
5. **Navigation Components**: Use for user navigation and app structure
6. **Feedback Components**: Use to communicate status and results to users

### **Accessibility Best Practices**

- Always include proper `aria-label` attributes for icon-only buttons
- Use semantic HTML elements (`<button>`, `<input>`, `<label>`)
- Ensure sufficient color contrast for all text and interactive elements
- Provide clear focus states for keyboard navigation
- Include descriptive text for screen readers

### **Responsive Considerations**

- Test components on all breakpoints (sm, md, lg, xl, 2xl)
- Use responsive utility classes for spacing and sizing
- Ensure touch targets are appropriately sized for mobile devices
- Consider mobile-first design patterns

### **Performance Guidelines**

- Minimize the use of complex animations on mobile devices
- Use CSS transforms instead of changing layout properties
- Optimize backdrop-filter usage for better performance
- Consider reducing shadow complexity on lower-end devices

---

**Last Updated**: <%= Date.current.strftime("%B %d, %Y") %>
**Version**: 1.0.0
**Next Review**: <%= (Date.current + 30.days).strftime("%B %d, %Y") %>
