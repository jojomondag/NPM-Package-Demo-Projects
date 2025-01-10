# display-names

A simple NPM package that provides a list of 5 names for display in a browser.

## Installation

```bash
npm install display-names
```

## Usage

### Basic Usage

```javascript
const names = require('display-names');

// names is an array of 5 names that you can use in your application
console.log(names); // Will display the array of names
```

### Example in Browser

```javascript
const names = require('display-names');

// Display names in HTML
const namesList = document.createElement('ul');
names.forEach(name => {
    const li = document.createElement('li');
    li.textContent = name;
    namesList.appendChild(li);
});
document.body.appendChild(namesList);
```

## Development

To build the package:
```bash
npm run build
```

To rebuild (includes cleaning dist directory):
```bash
npm run rebuild
```

### Testing the Package

To test your changes:

1. Make sure you have two directories side by side:
   - `UnderstandingNpm` (this package)
   - `TestingUnderstandingNpm` (test environment)

2. Run the rebuild script using one of these methods:
   - Right-click on `rebuild.ps1` and select "Run with PowerShell"
   - Open PowerShell in the project directory and run:
     ```powershell
     .\rebuild.ps1
     ```
   - Or use npm script:
     ```bash
     npm run rebuild
     ```

3. After the script completes:
   - Open `TestingUnderstandingNpm/index.html` in your browser
   - Press Ctrl+F5 to force a complete refresh

The rebuild script will:
- Clean the build directories
- Install dependencies
- Rebuild the package
- Install and test it in the test environment

## License

MIT
