To install the automation, copy the content 
into home_assistant config/custom_components directory and restart the home assistant. 

For me it's: /Volumes/Docker-1/HomeAssistant/custom_components on QNAP. 

Consider adding deploy.sh script that copies the dir to qnap and restarts the home_assistant docker container.