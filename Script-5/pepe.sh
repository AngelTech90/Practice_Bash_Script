#!/bin/bash

list_of_bootstrap_regions=(
    "SidebarRightRegion"
    "SidebarLeftRegion"
    "MainContentRegion"
    "BeforeFooterRegion"
    "AfterContentRegion"
    "AfterFullWidthContentRegion"
    "HighLightedRegion"
    "BrandingRegion"
    "MainMenuRegion"
)



# # * Here we create our general components:
#     cd "./project-oktv/src/components/bootstrap_regions"
#     echo "Creating bootstrap regions..."

#     for region in "${list_of_bootstrap_regions[@]}"; do
#         mkdir $region
#         cd $region
#         touch $region.jsx $region.module.css readme.md
#         echo "$region created"
#         cd ..
#     done

cd "./project-oktv/src/components/bootstrap_regions"

 for region in "${list_of_bootstrap_regions[@]}"; do
    cd $region
    echo "
import styles from './$region.module.css';
import 'bootstrap'

export default function $region({children}){

    return(
        <div>
            {children}
        </div>
    )
}    
    " > $region.jsx
    cd ..
done