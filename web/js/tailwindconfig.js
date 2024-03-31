tailwind.config = {
  theme: {
    extend: {
      colors: {
        primary: "#1b2330",
        primaryLight: "#405270",
      },
      keyframes: {
        wiggle: {
          "0%, 100%": { transform: "translate(0px, 10px)" },
          "50%": { transform: "translate(0px, -10px)" },
        },
      },
      animation: {
        wiggle: "wiggle 3s ease-in-out infinite",
      },
    },
  },
};
