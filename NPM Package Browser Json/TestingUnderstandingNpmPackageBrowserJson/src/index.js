// Import the names from the package
const names = require('understanding-npm-package-browser-json');

// Function to initialize the names display
function initializeNames() {
    const container = document.getElementById('names-container');
    const namesList = document.createElement('ul');
    namesList.className = 'names-list';
    
    names.forEach(name => {
        const listItem = document.createElement('li');
        listItem.textContent = name;
        listItem.className = 'name-item';
        namesList.appendChild(listItem);
    });
    
    container.appendChild(namesList);
}

// Call the function when the DOM is loaded
document.addEventListener('DOMContentLoaded', initializeNames); 