#!/bin/bash

# Technologies and others:

# Update package list
sudo apt update

# Install curl if not already installed (needed for Node.js installation)
sudo apt install -y curl

# Install Python (latest LTS version)
sudo apt install -y python3 && echo "python installed"

# Add NodeSource repository for the latest LTS version of Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs && echo "nodejs installed"

# Install g++
sudo apt install -y g++ && echo "g++ installed"

# Install git
sudo apt install -y git && echo "git installed"

# Install pnpm:
sudo apt update
npm install -y -g pnpm && echo "pnpm installed"
pnpm --version


# Verify installations
echo "Python version:"
python3 --version

echo "Node.js version:"
node -v

echo "g++ version:"
g++ --version

echo "Git version"
git --version

#Git configurations:
git config --global user.name "Angel_Molina"
git config --global user.email "angelmolinaimas@gmail.com"
git config --global core.user "code --wait"
git config --global color.ui "true"
git config --global core.autocrlf input



# Update the package list
sudo apt update

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo snap install -y --classic code && echo "installed VS code"

# Install Discord
echo "Installing Discord..."
sudo snap install -y discord && echo "installed discord"

# Install GitHub Desktop
echo "Installing GitHub Desktop..."
sudo snap install -y github-desktop --classic && echo "installed github-desktop"

# Install Draw.io
echo "Installing Draw.io..."
sudo snap install -y drawio && echo "installed drawio"

# Install Opera One
echo "Installing Opera One..."
wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -
echo "deb https://deb.opera.com/opera-stable/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-stable.list
sudo apt update
sudo apt install -y opera-stable && echo "installed opera-stable"

# Install VirtualBox
echo "Installing VirtualBox..."
sudo apt install -y virtualbox && echo "installed virtualbox"

# Install GIMP
echo "Installing GIMP..."
sudo apt install -y gimp && echo "installed gimp"

# Install Wine
echo "Installing Wine..."
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine64 wine32 && echo "installed wine"

echo "All applications have been installed successfully!"


# Extensions for VScode:

List_of_extensions=(
    "ecmel.vscode-html-css"
    "ms-vscode.vscode-typescript-next"
    "PKief.material-icon-theme"
    "ms-vscode.PowerShell"
    "ms-python.python"
    "astro-build.astro"
    "mivz.discord-rich-presence"
    "mikestead.dotenv"
    "dbaeumer.vscode-eslint"
    "cstrap.flask-snippets"
    "mikestead.image-preview"
    "wix.vscode-import-cost"
    "oderwat.indent-rainbow"
    "Zignd.html-css-class-completion"
    "xabikos.JavaScriptSnippets"
    "ritwickdey.LiveServer"
    "christian-kohler.path-intellisense"
    "esbenp.prettier-vscode"
    "bradgashler.tailwindcss-intellisense"
)

for item in "${List_of_extensions[@]}"; do
    code --install-extension "$item" && echo "installed $item"
done

#GitHub and git configuraions
echo "Loading GitHub repos"

# We create main directory
mkdir GitHub_repositories
cd GitHub_repositories

GitHub_user=" "
GitHub_api_key=" "

#We clone all our repos first defining our list of links:
List_of_Repos=(

    "https://github.com/AngelTech90/ReactJS"
    "https://github.com/AngelTech90/SQL"
    "https://github.com/AngelTech90/Practice_Bash_Script "
    "https://github.com/AngelTech90/JavaScript_Notes-2"
    "https://github.com/AngelTech90/TypeScript"
    "https://github.com/AngelTech90/Gimp_portfolio"
    "https://github.com/AngelTech90/Nodejs_and_Express"
    "https://github.com/AngelTech90/Canva_portfolio"
    "https://github.com/AngelTech90/Notion_practices "
    "https://github.com/AngelTech90/TailwindCSS-AlpineJS "
    "https://github.com/AngelTech90/BootStrap"
    "https://github.com/AngelTech90/AngelTech_Shop"
    "https://github.com/AngelTech90/Practice_PowerShell"
    "https://github.com/AngelTech90/Mokepon_AI-2 "
    "https://github.com/AngelTech90/AstroJS"
    "https://github.com/AngelTech90/Mokepon_project "
    "https://github.com/AngelTech90/University_tasks "
    "https://github.com/AngelTech90/Codewars_Excersizes"
    "https://github.com/AngelTech90/icecream_shop_project"
    "https://github.com/AngelTech90/Python_micro_projects"
    "https://github.com/AngelTech90/Prove_Gmail_templates"
    "https://github.com/AngelTech90/Canva_portfolio"
    "https://github.com/AngelTech90/Python"
    "https://github.com/AngelTech90/Bootstrap"

)

for repo in "${List_of_Repos[@]}"; do
    git clone "$repo"
    cd "$repo"
    git fetch
    git pull
    cd ..
done


