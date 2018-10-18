#!/bin/bash -ex

[ -f MicrosoftJIRASSO6x7x.obr ] || wget https://download.microsoft.com/download/3/C/9/3C94C886-0C89-4182-A758-6DB982E1F398/MicrosoftJIRASSO6x7x.obr

if [ ! -f MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1.jar ]
then
  mkdir -p MicrosoftJIRASSO6x7x
  cd MicrosoftJIRASSO6x7x
  jar xf ../MicrosoftJIRASSO6x7x.obr
  cd ..
fi

if [ ! -f MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1/templates/jira-configure/jiraSSOConfiguration.vm ] ; then
  mkdir -p MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1/
  cd MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1/
  jar xf ../MSSsoJiraPlugin-1.0.1.jar
  cd ../..
fi

cp -f jiraSSOConfiguration.vm MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1/templates/jira-configure/jiraSSOConfiguration.vm

rm -f ../MSSsoJiraPlugin-1.0.1.jar
cd MicrosoftJIRASSO6x7x/MSSsoJiraPlugin-1.0.1/
jar cf ../MSSsoJiraPlugin-1.0.1.jar .

