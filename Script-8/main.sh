#!/bin/bash

#! We recommend data better comments extensions

#* This file is for index in our components jsx files neccesary dependencies and connect all neccesary modules


#* This data structures contains base names of our components 
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

#We set pages components
cd "../../../project-oktv/src/pages" 

echo "Setting page components..."
for page in "${list_of_pages_components[@]}"; do
    
    cd $page

echo "//First we will import react-router-dom modules:
import './$page.css'
import 'bootstrap'

export default function $page({children}){

    return(
        <div>
            {children}
        </div>
    )
}
" > $page.jsx

    cd ..

done


echo "<!doctype html>
<html lang='en'>
  <head>
    <meta charset='UTF-8' />
    <link rel='icon' type='image/svg+xml' href='#' />
    <link rel='stylesheet' href='./global.css' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OkTV dashboard</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="./main.jsx"></script>
  </body>
</html>" > index.html

echo "page components setted"


#We set main components
cd "../components/main_components"

echo "Setting main components..."
for main in "${list_of_main_components[@]}"; do

    cd $main

echo "//First we will import react-router-dom modules:
import './$main.css'
import 'bootstrap'
    
export default function $main(){

    return(
        <div>
            {children}
        </div>
    )
}
    " > $main.jsx

    cd ..

done
echo "main components setted"

#We set general components
cd "../general_components"

echo "Setting general components..."
for general in "${list_of_general_components[@]}"; do

    cd $general

echo "//First we will import react-router-dom modules:
import './$general.css'
import 'bootstrap'

export default function $general(){

    return(
        <div>
        </div>
    )
}
" > $general.jsx

    cd ..

done
echo "general components setted"

