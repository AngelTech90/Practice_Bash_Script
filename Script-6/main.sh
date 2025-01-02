#!/bin/bash

#!I recommend install better comments extension for read this

#* We define vars for users asks for avaible resources:
response_repo="."
response_node="."
response_react="."
response_components="."
response_dependencies="."

#?Optional:
echo "Have you clonned the repo yet?"
read response_repo

if [ $response_repo = "no" ] || [ $response_repo = "NO" ] || [ $response_repo = "No" ]; then

    echo "Clonning into repo..."
    git clone https://github.com/sebnano/oktv-dashboard
    echo "Repositorie was clonned"
    cd OKTV_Dashboard
    git fetch

elif [ $response_repo = "yes" ] || [ $response_repo = "YES" ] || [ $response_repo = "Yes" ] ; then
    echo "Fine, let's keep running script"
fi

#* We define data structures

list_of_dependencies=(
    "express" 
    "axios" 
    "bootstrap" 
    "chartJS"
    "vite"
    "react-bootstrap"
    "react-icons"
)

#* Page components:
list_of_pages_components=(

    # Pages Components
    "CreateAccountPage"
    "SignInPage"
    "HomeDashboardPage"
    "ChannelDashboardPage"
    "ReportDashboardPage"
    "SettingsDashboardPage"

)

list_of_main_components=(

    # Main Components
    "CreateAccountForm"
    "HomepageFooter"
    "HomepageHeader"
    "LoginForm"
    "ChannelsContainer"
    "OperatorsContainer"
    "VisualizationTimeStatisticCard"
    "WeeklyViewsStatisticCard"
    "OverallPerformanceStatisticCard"
    "SettingsContainer"
    "GmailsContainer"

)

list_of_general_components=(

    # General Components
    "MotherBox"
    "OperatorCard"
    "SidebarMenu"
    "RegisteredChannelCard"
    "SearchAndNotificationsBar"
    "StatisticsCard"
    "CreateAccountInput"
    "GeneralButton"
    "GmailAddress"
    "SettingPageInput"

)

list_of_bootstrap_regions=(
    "SidebarRightRegion",
    "SidebarLeftRegion",
    "MainContentRegion",
    "BeforeFooterRegion",
    "AfterContentRegion",
    "AfterFullWidthContentRegion",
    "HighLightedRegion",
    "BrandingRegion",
    "MainMenuRegion",
)

#* We question to user for see if they have node installed
echo "Have you node installed?"
read response_node

#* If it isn't we install nodeJS
if [ $response_node = "no" ] || [ $response_node = "NO" ] || [ $response_node = "No" ]; then

    echo "installing node..."
    sudo apt update
    sudo apt install -y curl
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
    node -v
    npm -v
    echo "Node installed"

elif [ $response_node = "yes" ] || [ $response_node = "YES" ] || [ $response_node = "Yes" ]; then
    echo "Good, let's keep setting enviroment"
fi


#* We install react and create project
echo "Have you react installed in project?"
read response_react

if [ $response_react = "no" ] || [ $response_react = "NO" ] || [ $response_react = "No" ]; then

    echo "Creating React project..."
    cd "../../../"
    npm i -y
    npm install vite@latest 
    npm create vite@latest project-oktv
    cd "./project-oktv"
    npm i -y
    echo "React project created"

elif [ $response_react = "yes" ] || [ $response_react = "YES" ] || [ $response_react = "Yes" ]; then
    echo "Perfect, let's keep running the script"
fi

#* we install dependencies
echo "Have you dependencies installed?"
read response_dependencies

if [ $response_dependencies = "no" ] || [ $response_dependencies = "NO" ] || [ $response_dependencies = "No" ] ; then

    cd "../../../project-oktv/"

    for dependency in "${list_of_dependencies[@]}"; do
        npm i $dependency
        echo "$dependency installed"
    done

elif [$response_dependencies = "yes"] || [$response_dependencies = "YES"] || [$response_dependencies = "Yes"] ; then
    echo "Perfect, let's keep running script"
fi

#* Here we define the initial structure of components of projects
echo "You have have builded your components structure?"
read response_components

if [ $response_components = "no" ] || [ $response_components = "NO" ] || [ $response_components = "No" ]; then

    #* Here we define our components and pages
    cd "../../../project-oktv/src"
    echo "Defining initial structure..."
    mkdir components pages
    cd ./components
    mkdir main_components
    mkdir general_components

    #* Here we set our app pages
    echo "Setting page components..."
    cd "../../../project-oktv/src/pages"

    for page in "${list_of_pages_components[@]}"; do
        mkdir $page
        cd $page 
        touch $page.jsx $page.module.css readme.md index.html main.jsx
        echo "$page created"
        cd ..
    done


    #* Here create our main components:
    cd "../components/main_components"
    echo "Creating main components..."
    
    for main in "${list_of_main_components[@]}"; do
        mkdir $main
        cd $main
        touch $main.jsx $main.module.css readme.md 
        echo "$main created"
        cd ..
    done

    # * Here we create our general components:
    cd "../general_components"
    echo "Creating general components..."

    for general in "${list_of_general_components[@]}"; do
        mkdir $general
        cd $general
        touch $general.jsx $general.module.css readme.md
        echo "$general created"
        cd ..
    done

    # * Here we create our general components:
    cd "../bootstrap_regions"
    echo "Creating bootstrap regions..."

    for region in "${list_of_bootstrap_regions[@]}"; do
        mkdir $region
        cd $region
        touch $region.jsx $region.module.css readme.md
        echo "$region created"
        cd ..
    done
    



elif [ $response_components = "yes" ] || [ $response_components = "YES" ] || [ $response_components = "Yes" ]; then
    echo "Fine, i see that you have all project ready, just keep coding, and avoid use this script more times, it could be dangerous for project "

    cd ../../
fi
