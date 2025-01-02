
#* Page components:
list_of_pages_components=(

    # Pages Components
    "ChannelDashboardPage"
    "ReportDashboardPage"
    "SettingsDashboardPage"

)

list_of_main_components=(

    # Main Components
    "ChannelsContainer"
    "VisualizationTimeStatisticCard"
    "WeeklyViewsStatisticCard"
    "OverallPerformanceStatisticCard"
    "SettingsContainer"
    "GmailsContainer"

)

list_of_general_components=(

    # General Components
    "RegisteredChannelCard"
    "SearchAndNotificationsBar"
    "StatisticsCard"
    "GmailAddress"
    "SettingPageInput"

)

cd "./project-oktv/src/components/main_components/"

for main in "${list_of_main_components[@]}"; do
    cd $main
    mv $main.css $main.module.css
    echo "
import styles from './$main.module.css';
import 'bootstrap'

export default function $main(){

    return(
        <div>

        </div>
    )
}
" > $main.jsx
    cd ..
done

cd "../../pages"
for page in "${list_of_pages_components[@]}"; do
    cd $page
    mv $page.css $page.module.css
    echo "
import styles from './$page.module.css';
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

cd "../components/general_components/"
for general in "${list_of_general_components[@]}"; do
    cd $general
    mv $general.css $general.module.css
    echo "
import styles from './$general.module.css';
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