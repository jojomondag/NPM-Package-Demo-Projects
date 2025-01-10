# understanding-npm-package-browser-json

A demonstration of how to create an NPM package that:
- Includes JSON data that can be used directly in a browser
- Uses webpack to package the JSON data for browser compatibility
- Can be installed and used in any web project via npm install

## Quick Start

1. Clone this repository
2. Open PowerShell in the `UnderstandingNpmPackageBrowserJson` directory
3. Run the rebuild script:
   ```powershell
   .\rebuild.ps1
   ```
4. Open `TestingUnderstandingNpmPackageBrowserJson/index.html` in your browser
5. Press Ctrl+F5 to see the results

## Usage

### Browser (via CDN)
```html
<!-- Import the package -->
<script src="https://cdn.jsdelivr.net/npm/understanding-npm-package-browser-json/dist/index.js"></script>

<script>
    // Access the names array
    const names = understandingNpmPackageBrowserJson.default;
    
    // Use the names
    names.forEach(name => console.log(name));
</script>
```

### Installation
```bash
npm install understanding-npm-package-browser-json
```

```javascript
const names = require('understanding-npm-package-browser-json');

// names is an array of 5 names that you can use in your application
console.log(names); // Will display the array of names
```

### Example in Browser

```javascript
const names = require('understanding-npm-package-browser-json');

// Display names in HTML
const namesList = document.createElement('ul');
names.forEach(name => {
    const li = document.createElement('li');
    li.textContent = name;
    namesList.appendChild(li);
});
document.body.appendChild(namesList);
```

## License

MIT