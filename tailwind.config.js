/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{js,jsx,ts,tsx}'],
  theme: {
    
    extend: {
      colors: {
        'a-orange': '#fe8801',
        'a-dark-1': '#37475f',
        'a-dark-2': '#59667a',
      },
    },
  },
  plugins: [],
};

