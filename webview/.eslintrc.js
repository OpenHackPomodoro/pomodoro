module.exports = {
	"extends": [
		"airbnb",
		"plugin:react/recommended",
	],
	"parserOptions": {
		"ecmaVersion": 6,
		"sourceType": "module",
		"ecmaFeatures": {
			"jsx": true,
		},
	},
	"plugins": ["react", "jest"],
	// 0: "off", 1: "warn", 2: "error"
	"rules": {
		"object-curly-spacing": ["error", "always"],
		"react/jsx-filename-extension": ["error", { "extensions": [".js", ".jsx"] }],
    "no-multiple-empty-lines": ["error", { "max": 2, "maxEOF": 1  }],
    "jsx-quotes": ["error", "prefer-single"],
	},
	"env": {
		"browser": true,
    "jest/globals": true,
	}
};
